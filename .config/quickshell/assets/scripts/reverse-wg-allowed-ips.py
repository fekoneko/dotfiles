#!/usr/bin/env python3
# Reverse Wireguard AllowedIPs and return semicolon-separated CIDRs
# Calculation logic borrowed from: https://github.com/nexusriot/wg_ips_calc
# Usage: reverse-wg-allowed-ips.py <ignored-ips>

import sys
import re
import ipaddress
from typing import List, Sequence, Tuple
from ipaddress import IPv4Network, IPv6Network

def parse_ips(text: str) -> Sequence[IPv4Network | IPv6Network]:
    '''
    Parse a list of IPs and CIDRs.

    Returns a list of ipaddress.IPv4Network / IPv6Network objects.
    Single IPs are converted to /32 (IPv4) or /128 (IPv6).
    '''
    tokens = []
    for part in re.split(r'[,\;\s\n\r\t]+', text.strip()):
        if not part:
            continue
        tokens.append(part)

    nets = []
    for token in tokens:
        try:
            if '/' in token:
                n = ipaddress.ip_network(token, strict=False)
            else:
                addr = ipaddress.ip_address(token)
                prefix = 32 if addr.version == 4 else 128
                n = ipaddress.ip_network(f'{addr}/{prefix}', strict=False)
            nets.append(n)
        except Exception as e:
            raise ValueError(f"Invalid IP/CIDR '{token}': {e}")
    return nets


def split_networks_by_ip_version(nets: Sequence[IPv4Network | IPv6Network]) -> Tuple[List[IPv4Network], List[IPv6Network]]:
    v4, v6 = [], []
    for n in nets:
        if n.version == 4:
            v4.append(n)
        else:
            v6.append(n)
    return v4, v6


def nets_to_ranges(nets: Sequence[IPv4Network | IPv6Network]) -> List[Tuple[int, int]]:
    '''Convert networks to inclusive numeric ranges [start, end].'''
    ranges = []
    for n in nets:
        start = int(n.network_address)
        end = int(n.broadcast_address)
        ranges.append([start, end])
    return ranges


def subtract_one_range_list(ranges: List[Tuple[int, int]], remove_range: Tuple[int, int]) -> List[Tuple[int, int]]:
    '''Subtract one inclusive [c, d] range from a list of inclusive [a, b] ranges.'''
    c, d = remove_range
    result = []

    for a, b in ranges:
        # No overlap
        if d < a or c > b:
            result.append([a, b])
            continue

        # Full cover: drop [a, b]
        if c <= a and d >= b:
            continue

        # Partial overlaps
        if c <= a <= d < b:
            result.append([d + 1, b])
            continue

        if a < c <= b <= d:
            result.append([a, c - 1])
            continue

        if a < c and d < b:
            result.append([a, c - 1])
            result.append([d + 1, b])
            continue
    return result


def subtract_ranges(allowed_ranges: List[Tuple[int, int]], disallowed_ranges: List[Tuple[int, int]]) -> List[Tuple[int, int]]:
    '''Subtract all disallowed ranges from allowed ranges.'''
    result = allowed_ranges
    for dr in disallowed_ranges:
        result = subtract_one_range_list(result, dr)
    return result


def intersect_ranges(ranges_a: List[Tuple[int, int]], ranges_b: List[Tuple[int, int]]) -> List[Tuple[int, int]]:
    '''Return the intersection of two lists of inclusive [start, end] ranges.'''
    result = []
    for a, b in ranges_a:
        for c, d in ranges_b:
            lo, hi = max(a, c), min(b, d)
            if lo <= hi:
                result.append([lo, hi])
    return result


def ranges_to_nets(ranges: List[Tuple[int, int]], version: int) -> List[IPv4Network | IPv6Network]:
    '''
    Convert inclusive [start, end] ranges back to a minimal set of CIDRs.
    Uses ipaddress.summarize_address_range + collapse_addresses.
    '''
    if not ranges:
        return []

    addr_cls = ipaddress.IPv4Address if version == 4 else ipaddress.IPv6Address

    nets = []
    for start, end in ranges:
        nets.extend(ipaddress.summarize_address_range(addr_cls(start), addr_cls(end)))

    nets = list(ipaddress.collapse_addresses(nets))
    nets.sort(key=lambda n: int(n.network_address))
    return nets

ignored_ips = sys.argv[1]

try:
    if not ignored_ips.strip():
        raise ValueError('No Ignored IPs specified.')

    all_nets = parse_ips('0.0.0.0/0;::/0')
    all_v4_nets, full_v6_nets = split_networks_by_ip_version(all_nets)
    all_v4_ranges = nets_to_ranges(all_v4_nets)
    all_v6_ranges = nets_to_ranges(full_v6_nets)

    ignored_nets = parse_ips(ignored_ips)
    ignored_v4_nets, ignored_v6_nets = split_networks_by_ip_version(ignored_nets)
    ignored_v4_ranges = nets_to_ranges(ignored_v4_nets)
    ignored_v6_ranges = nets_to_ranges(ignored_v6_nets)

    result_v4 = ranges_to_nets(subtract_ranges(all_v4_ranges, ignored_v4_ranges), 4)
    result_v6 = ranges_to_nets(subtract_ranges(all_v6_ranges, ignored_v6_ranges), 6)

    result = ''
    for n in result_v4:
        result += f'{n.network_address}/{n.prefixlen};'
    for n in result_v6:
        result += f'{n.network_address}/{n.prefixlen};'
    result = result[:-1]

    print(result)

except Exception as e:
    print(e, file=sys.stderr)
    exit(1)

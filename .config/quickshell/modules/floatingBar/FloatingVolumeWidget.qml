import qs.services

FloatingBarBlock {
    icon: AudioService.volumeIcon
    text: AudioService.muted ? null : AudioService.formattedVolume
    showOnChange: true
}

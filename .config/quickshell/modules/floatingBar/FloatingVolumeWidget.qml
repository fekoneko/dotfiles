import qs.services

FloatingBarButton {
    icon: AudioService.volumeIcon
    text: AudioService.muted ? null : AudioService.formattedVolume
    showOnChange: true
}

extends Control
@onready var h_slider: HSlider = %HSlider
const LEVEL_1_ECHOES_IN_THE_NIGHT = preload("res://Asset/Sounds/Level1/Level 1_Echoes in the Night.mp3")
func _ready() -> void:
	AudioPlayer.play(LEVEL_1_ECHOES_IN_THE_NIGHT)
	h_slider.value=AudioPlayer.get_volume(0)
	



func _on_h_slider_value_changed(value: float) -> void:
	AudioPlayer.set_volume(0,value)

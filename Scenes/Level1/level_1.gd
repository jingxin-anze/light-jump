extends Node2D

const LEVEL_1 = preload("res://Asset/Sounds/Level1/Level 1_Echoes in the Night.mp3")

func _ready() -> void:
	AudioPlayer.play(LEVEL_1,true,false)

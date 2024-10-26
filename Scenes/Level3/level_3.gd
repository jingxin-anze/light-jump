extends Node2D

const Level3Bg = preload("res://Asset/Sounds/Level3/Reach for the Sky.mp3")

func _ready() -> void:
	AudioPlayer.play(Level3Bg,true,false)

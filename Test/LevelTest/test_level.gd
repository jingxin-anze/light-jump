extends Node2D

const bg= preload("res://Test/LevelTest/Art/7c83b415fc2fcca0e70efce0c20f2af9.mp3")
var save_one:bool
var audi:AudioStreamPlayer

func _ready() -> void:
	audi=AudioPlayer.play(bg,false,false)

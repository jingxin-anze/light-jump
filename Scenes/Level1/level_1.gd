extends Node2D

const LEVEL_1 = preload("res://Asset/Sounds/Level1/Level 1_Echoes in the Night.mp3")
@onready var data:GameData=ResourceLoader.load("user://game_data.tres") as GameData

func _ready() -> void:
	AudioPlayer.play(LEVEL_1,true,false)
	data.level="level1"
	ResourceSaver.save(data,"user://game_data.tres")

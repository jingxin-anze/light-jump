extends Node2D

@onready var tile_map_layer: TileMapLayer = $Envir/TileMapLayer
#@onready var data:GameData=ResourceLoader.load("user://game_data.tres") as GameData

var is_light:bool
var tile_top:Vector2=Vector2(0,0)

func _ready() -> void:
	#if data:
		#data.level="level2"
	#ResourceSaver.save(data,"user://game_data.tres")
	pass

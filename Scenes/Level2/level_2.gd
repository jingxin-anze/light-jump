extends Node2D

@onready var tile_map_layer: TileMapLayer = $Envir/TileMapLayer
var is_light:bool

var tile_top:Vector2=Vector2(0,0)

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
		
	if is_light:
		tile_map_layer.set_cell(Vector2i(71,8),0,tile_top)
		tile_map_layer.set_cell(Vector2i(72,8),0,tile_top)
		tile_map_layer.set_cell(Vector2i(73,8),0,tile_top)
		tile_map_layer.set_cell(Vector2i(74,8),0,tile_top)
		tile_map_layer.set_cell(Vector2i(75,8),0,tile_top)

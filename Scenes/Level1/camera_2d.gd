extends Camera2D

@onready var tile_map: TileMapLayer = $"../../Envir/TileMapLayer"


func _ready() -> void:
	#此方法表示所有瓦片的矩形范围，返回矩形左上角坐标P和矩形的大小，有左上角坐标属性position和右下角坐标属性end
	var used:=tile_map.get_used_rect().grow(-1)
	var tile_size:=tile_map.tile_set.tile_size

	limit_bottom=used.end.y*tile_size.y
	limit_left=used.position.x*tile_size.x
	limit_right=used.end.x*tile_size.x
	limit_top=used.position.y*tile_size.y

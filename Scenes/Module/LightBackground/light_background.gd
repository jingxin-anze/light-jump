extends Node2D

var player_body:AnimatedSprite2D

func _ready() -> void:
	player_body=get_parent().get_node("Body")
	float_in_air()

#浮动灯光
func float_in_air():
	#创建Tween
	var t=create_tween()
	#设置循环
	t.set_loops()
	#移动
	t.tween_property(self,"position",position+Vector2(0,10),3)
	t.tween_property(self,"position",position+Vector2(0,-10),3)

func _physics_process(delta: float) -> void:
	#根据body的scale.x，改变自身的scale.x
	scale.x=abs(scale.x) if player_body.scale.x>0 else -abs(scale.x)

extends CharacterBody2D

#定义玩家的速度
@export var speed:float=100
#定义移动方向
var dir:Vector2

func _physics_process(delta: float) -> void:
	#根据输入确定移动
	dir=Input.get_vector("move_left","move_right","jump","down")
	velocity=dir*speed*delta
	
	#获得指向鼠标的向量
	var dir_r = get_global_mouse_position() - global_position
	#若长度大于5，则根据向量旋转自身
	if dir_r.length() > 5:
		rotation = dir_r.angle()
	
	#发射球体
	if Input.is_action_just_pressed("shoot"):
		#实例化球体
		var light_ball=preload("res://Test/TestLight/light_ball.tscn").instantiate()
		#将其置于根节点下
		get_parent().add_child(light_ball)
		#调用球体的Start函数，确保射出的角度正确
		light_ball.start(position,rotation,90)
		print(rotation)
		

	
	#自身移动
	move_and_collide(velocity)

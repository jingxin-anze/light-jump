extends CharacterBody2D

@export var speed:float=100
var dir:Vector2

func _physics_process(delta: float) -> void:
	dir=Input.get_vector("move_left","move_right","jump","down")
	velocity=dir*speed*delta
	
	var dir_r = get_global_mouse_position() - global_position
	if dir_r.length() > 5:
		rotation = dir_r.angle()
		
	if Input.is_action_just_pressed("shoot"):
		var light=preload("res://Test/TestLight/light_ball.tscn").instantiate()
		get_parent().add_child(light)
		light.start(position,rotation)
		
	move_and_collide(velocity)

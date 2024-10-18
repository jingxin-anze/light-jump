extends Node2D

var can_shoot:bool=true

func _physics_process(delta: float) -> void:
	if can_shoot:
		var light_ball=preload("res://Test/TestLight/light_ball.tscn").instantiate()
		get_parent().add_child(light_ball)
		light_ball.start(position,degrees_to_radians(14))
		can_shoot=false
	pass

func degrees_to_radians(degrees)->float:
	var radians = degrees * (PI / 180)
	return radians

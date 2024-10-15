extends Line2D

@export var max_points:int=220
var points_arry:Array
var target:CharacterBody2D

func _physics_process(delta: float) -> void:
	if points.size()<=max_points:
		if is_instance_valid(target):
				add_point(target.position)
	else:
		points.remove_at(0)

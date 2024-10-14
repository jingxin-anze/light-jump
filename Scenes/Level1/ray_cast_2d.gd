extends RayCast2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cast_point := target_position
	force_raycast_update()
	
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		
	$Line2D.points[1] = target_position
	

extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		body.fall_time_to_peak=1.3
		pass
		


func _on_body_exited(body: Node2D) -> void:
	if body.name=="Player":
		body.fall_time_to_peak=0.4

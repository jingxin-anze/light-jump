extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		if owner.save_one==true:
			$"../Player".position=$"../TestScenc".position
		else:
			get_tree().reload_current_scene()

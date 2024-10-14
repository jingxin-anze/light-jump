extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if is_instance_valid(area.get_parent()):
		if area.get_parent().has_meta("is_bat"):
			area.get_parent().is_flay_away=true

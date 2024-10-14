extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().has_meta("is_test"):
		print("999")

extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().is_bat:
		area.get_parent().is_flay_away=true

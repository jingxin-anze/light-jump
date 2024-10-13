extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Bat":
		body.is_flay_away=true

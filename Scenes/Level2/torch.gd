extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.is_flay_away=true

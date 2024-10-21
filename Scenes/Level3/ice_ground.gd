extends Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		body.SPEED/=1.5
		body.jump_event="null"

func _on_body_exited(body: Node2D) -> void:
	if body.name=="Player":
		body.SPEED*=1.5
		body.jump_event="jump"

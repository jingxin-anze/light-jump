extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		owner.save_one=true
		$"../DirectionalLight2D".energy=0.5

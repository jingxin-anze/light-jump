extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		print("pp")
		body.can_fall=false
		body.velocity.y=0
		body.vine_fall=true
		pass
	
	if body.name=="Snake":
		body.is_vine = true


func _on_body_exited(body: Node2D) -> void:
	if body.name=="Player":
		body.can_fall=true
		body.vine_fall=false
		
	if body.name=="Snake":
		body.is_vine = false
		

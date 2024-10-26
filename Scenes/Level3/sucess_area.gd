extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var t:Tween=get_tree().create_tween()
		t.tween_property(%SucessBg,"self_modulate:a",1,4)
	

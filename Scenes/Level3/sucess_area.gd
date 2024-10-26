extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.acceleration=0
		body.velocity=Vector2(0,0)
		var t:Tween=get_tree().create_tween()
		t.tween_property(%SucessBg,"self_modulate:a",1,4)
		await get_tree().create_timer(4).timeout
		get_tree().change_scene_to_file("res://Scenes/EndUI/end_ui.tscn")

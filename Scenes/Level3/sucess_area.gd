extends Area2D

var end_ui=preload("res://Scenes/EndUI/end_ui.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.acceleration=0
		var t:Tween=get_tree().create_tween()
		t.tween_property(%SucessBg,"self_modulate:a",1,4)
		var end_ui_ins=end_ui.instantiate()
		add_child(end_ui_ins)

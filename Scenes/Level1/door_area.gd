extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name=="LightBall":
		$"../../../Player/Camera2D".global_position=Vector2(2951,816)
		await get_tree().create_timer(0.3).timeout
		var an:AnimatedSprite2D=get_parent().get_node("AnimatedSprite2D")
		an.animation_finished.connect(fade_away.bind(an))
		an.play("Open")
	


func fade_away(an):
	var t:Tween=get_tree().create_tween()
	t.tween_property(an,"modulate:a",0,1)
	t.tween_callback(finished)

func finished():
	$"../../../Player/Camera2D".position=Vector2(0,0)
	get_parent().queue_free()

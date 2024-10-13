extends Area2D

@export var next_scene:PackedScene


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		AudioPlayer.clear()
		get_tree().call_deferred("change_scene_to_packed",next_scene)

extends Control


func _on_start_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://Scenes/Level1/level_1.tscn")

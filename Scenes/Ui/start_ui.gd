extends Control


func _on_start_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://Scenes/Level1/level_1.tscn")


func _on_contine_pressed() -> void:
	pass # Replace with function body.


func _on_set_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()

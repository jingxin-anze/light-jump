extends Control

var author_and_thanks=preload("res://Scenes/AuthorAndTanks/author_and_thanks.tscn")

func _ready() -> void:
	pass


func _on_author_pressed() -> void:
	var author_and_thanks_ins=author_and_thanks.instantiate()
	add_child(author_and_thanks_ins)


func _on_return_main_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Ui/start_ui.tscn")

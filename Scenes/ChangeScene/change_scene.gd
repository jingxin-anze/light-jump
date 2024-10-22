extends Area2D

@export var next_scene:PackedScene
@onready var data:GameData=ResourceLoader.load("user://game_data.tres") as GameData

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		AudioPlayer.clear()
		get_tree().call_deferred("change_scene_to_packed",next_scene)

	if next_scene.get_state().get_node_name(0)=="Level2":
		data.is_new_start=true
		data.is_contine_disabled=false
		ResourceSaver.save(data,"user://game_data.tres")

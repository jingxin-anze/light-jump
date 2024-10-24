extends Area2D

@export var next_scene:PackedScene
@onready var data:GameData=ResourceLoader.load("user://game_data.tres") as GameData

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		AudioPlayer.clear()
		get_tree().call_deferred("change_scene_to_packed",next_scene)
	
		match next_scene.get_state().get_node_name(0):
			"Level2":
				data.level="level2"
				data.is_new_start=true
				data.is_contine_disabled=false
				data.achieve_point["player_position"]=Vector2(200,-50)
				
			"Level3":
				data.level="level3"
				#data.achieve_point["player_position"]=Vector2(200,-50)
				pass
		ResourceSaver.save(data,"user://game_data.tres")
		
	

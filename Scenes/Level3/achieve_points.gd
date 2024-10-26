extends Node2D

@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")
@onready var data=ResourceLoader.load("user://game_data.tres")


func _on_achieve_area_1_body_entered(body: Node2D) -> void:
	if body is Player:
		data.achieve_point["player_position"]=player.position
		data.achieve_point["player_body_scale"]=player.get_node("Body").scale.x
		ResourceSaver.save(data,"user://game_data.tres")


func _on_achieve_area_2_body_entered(body: Node2D) -> void:
	if body is Player:
		data.achieve_point["player_position"]=player.position
		data.achieve_point["player_body_scale"]=player.get_node("Body").scale.x
		ResourceSaver.save(data,"user://game_data.tres")


func _on_achieve_area_3_body_entered(body: Node2D) -> void:
	if body is Player:
		data.achieve_point["player_position"]=player.position
		data.achieve_point["player_body_scale"]=player.get_node("Body").scale.x
		ResourceSaver.save(data,"user://game_data.tres")


func _on_achieve_area_4_body_entered(body: Node2D) -> void:
	if body is Player:
		data.achieve_point["player_position"]=self.position
		data.achieve_point["player_body_scale"]=player.get_node("Body").scale.x
		ResourceSaver.save(data,"user://game_data.tres")


func _on_achieve_area_5_body_entered(body: Node2D) -> void:
	if body is Player:
		data.achieve_point["player_position"]=self.position
		data.achieve_point["player_body_scale"]=player.get_node("Body").scale.x
		ResourceSaver.save(data,"user://game_data.tres")

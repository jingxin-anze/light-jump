extends Area2D

@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")
@onready var data=ResourceLoader.load("user://game_data.tres") as GameData
var lable:Label

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		data.achieve_point["player_position"]=self.position
		data.achieve_point["player_body_scale"]=player.get_node("Body").scale.x
		ResourceSaver.save(data,"user://game_data.tres")
		lable=Label.new()
		add_child(lable)
		lable.text="到达存档点，已自动存档。"

extends Area2D

@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		body.jump_event="null"
		body.is_on_cliff=true

func _on_body_exited(body: Node2D) -> void:
	if body.name=="Player":
		body.jump_event="jump"
		var node=body.get_children()
		for i in node:
			if i is Label:
				i.queue_free()
		body.is_on_cliff=false

extends Area2D

var player:Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.to_death = true

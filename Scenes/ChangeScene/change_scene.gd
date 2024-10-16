extends Area2D

@export var next_scene:PackedScene
@onready var light: DirectionalLight2D = $DirectionalLight2D
@onready var black_bg: Sprite2D = $BlackBg

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		AudioPlayer.clear()

		get_tree().call_deferred("change_scene_to_packed",next_scene)

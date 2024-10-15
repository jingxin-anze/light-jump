extends Area2D

@export var next_scene:PackedScene
@onready var light: DirectionalLight2D = $DirectionalLight2D
@onready var black_bg: Sprite2D = $BlackBg

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		AudioPlayer.clear()
		
		var t:Tween=get_tree().create_tween()
		t.set_parallel().tween_property(light,"energy",2,1)
		t.set_parallel().tween_property(black_bg,"modulate:a",1,1)
		var tw:Tween=get_tree().create_tween()
		tw.set_parallel().tween_property(light,"energy",0,1)
		tw.set_parallel().tween_property(black_bg,"modulate:a",0,1)
		
		get_tree().call_deferred("change_scene_to_packed",next_scene)

#func _ready() -> void:
		#var t:Tween=get_tree().create_tween()
		#t.set_parallel().tween_property(light,"energy",2,1)
		#t.set_parallel().tween_property(black_bg,"modulate:a",1,1)
		#var tw:Tween=get_tree().create_tween()
		#tw.set_parallel().tween_property(light,"energy",0,1)
		#tw.set_parallel().tween_property(black_bg,"modulate:a",0,1)

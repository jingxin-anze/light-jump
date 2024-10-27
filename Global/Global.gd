extends Node

var frog_on_strike:bool
var setting=preload("res://Scenes/Setting/setting.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		var setting_ins=setting.instantiate()
		add_child(setting_ins)

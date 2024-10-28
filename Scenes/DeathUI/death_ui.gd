extends Control

@onready var data:GameData=ResourceLoader.load("user://game_data.tres") as GameData

func _ready() -> void:
	AudioPlayer.clear()
	self.modulate.a=0
	var t:Tween=get_tree().create_tween()
	t.tween_property(self,"modulate:a",1,5)
	if Global.frog_on_strike:
		%YouDie.text="青蛙罢工了"


func _on_return_achieve_point_pressed() -> void:
	print(data.level)
	match data.level:
		"level1":
			get_tree().change_scene_to_file("res://Scenes/Level1/level_1.tscn")
		"level2":
			get_tree().change_scene_to_file("res://Scenes/Level2/level_2.tscn")
		"level3":
			get_tree().change_scene_to_file("res://Scenes/Level3/level_3.tscn")

func _on_return_main_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Ui/start_ui.tscn")

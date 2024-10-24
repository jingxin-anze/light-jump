extends Control

var data:GameData
@onready var start: Button = %Start
@onready var contine: Button = %Contine
@onready var sett: Button = %Set
@onready var exit: Button = %Exit

func _ready() -> void:
	data=( ResourceLoader.load("user://game_data.tres") as GameData) if (ResourceLoader.load("user://game_data.tres")) else GameData.new()
	contine.disabled=true if data.is_contine_disabled else false
	ResourceSaver.save(data,"user://game_data.tres")

func _on_start_pressed() -> void:
	if not data.is_new_start:
		get_tree().call_deferred("change_scene_to_file","res://Scenes/Level1/level_1.tscn")
	else:
		%Cover.visible=true

func _on_contine_pressed() -> void:
	var path:String
	match data.level:
		"level2":
				path="res://Scenes/Level2/level_2.tscn"
		"level3":
			path="res://Scenes/Level3/level_3.tscn"
	get_tree().call_deferred("change_scene_to_file",path)

func _on_set_pressed() -> void:
	var setting=preload("res://Scenes/Setting/setting.tscn").instantiate()
	add_child(setting)

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_yes_pressed() -> void:
	if FileAccess.file_exists("user://game_data.tres"):
		DirAccess.remove_absolute("user://game_data.tres")
		%Cover.hide()
		get_tree().reload_current_scene()
	else:
		printt("无法找到存档文件！")
	

func _on_no_pressed() -> void:
	%Cover.hide()

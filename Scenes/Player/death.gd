extends StateBase

@export var player: Player 
@export var death_ui:PackedScene

func enter() -> void:
	get_tree().change_scene_to_packed(death_ui)

func physics_process_update(_delta: float) -> void:
	pass

## 退出状态
func exit() -> void:

	pass

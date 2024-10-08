class_name StateMachine
extends Node2D

@export var current_state: StateBase
@export var player: Player

func _ready() -> void:
	for child in get_children():
		if child is StateBase:
			child.state_machine = self
	await get_parent().ready
	current_state.enter()

#func _process(delta: float) -> void:
	#current_state.process_update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_process_update(delta)

## 修改状态
func change_state(target_state_name: String) -> void:
	var target_state = get_node_or_null(target_state_name)
	if target_state == null:
		printerr("状态传入错误")
		return
	current_state.exit()
	current_state = target_state
	current_state.enter()

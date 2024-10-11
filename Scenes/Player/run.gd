extends StateBase

@export var player: Player 

func enter() -> void:

	player.can_jump = true

func physics_process_update(delta: float) -> void:
	player.player_move_1(player.fall_gravity,delta)
	if not player.is_on_floor() :
		state_machine.change_state("Fall")
## 退出状态
func exit() -> void:
	pass


func _on_hand_animation_finished() -> void:
	state_machine.change_state("Idle")

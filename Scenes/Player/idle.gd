extends StateBase

@export var player: Player 

func enter() -> void:
	hand.play("Idle")
	player.can_jump = true

func physics_process_update(delta: float) -> void:
	player.player_move_1(player.fall_gravity,delta)
	if not player.is_on_floor():
		state_machine.change_state("Fall")
	if Input.is_action_just_pressed("attack"):
		state_machine.change_state("Attack")

func exit() -> void:
	pass

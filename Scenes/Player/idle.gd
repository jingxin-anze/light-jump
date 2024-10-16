extends StateBase

@export var player: Player 

func enter() -> void:
	body.play("Idle")
	hand.play("Idle")


func physics_process_update(delta: float) -> void:
	player.player_move_1(player.fall_gravity,delta)
	if player.direction:
		state_machine.change_state("Walk")
	if Input.is_action_just_pressed("attack"):
		state_machine.change_state("Attack")
	if Input.is_action_just_pressed("attack2"):
		state_machine.change_state("Attack2")
	if player.cache_jump > 0 and player.is_on_floor():
		state_machine.change_state("Jump")
		return
	if not player.is_on_floor():
		player.coyote_time.start()
		state_machine.change_state("Fall")
		return


func exit() -> void:
	pass

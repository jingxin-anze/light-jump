extends StateBase

@export var player: Player 

func enter() -> void:
	hand.animation_finished.connect(func():state_machine.change_state("Idle"))
	hand.play("Attack2")
	body.play("Attack2")

func physics_process_update(delta: float) -> void:
	player.player_move_1(player.fall_gravity,delta)
	if not player.is_on_floor():
		state_machine.change_state("Fall")
		
	check_frog_collision(player, player.right, 40)
	check_frog_collision(player, player.left, -40)

## 退出状态
func exit() -> void:
	pass
	
	
func check_frog_collision(player: Player, ray: RayCast2D, offset: float) -> void:
	if ray.is_colliding() and ray.get_collider().name == "Frog":
		if player.hand.animation == "Attack2" and player.hand.frame == 2:
			var frog = ray.get_collider()
			frog.position.x += offset

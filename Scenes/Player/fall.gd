extends StateBase

@export var player: Player 
@export var vine_fall_speed:int=3500
@export var extreme_speed:float=0.7
var time:float

func enter() -> void:
	hand.animation="Attack2"
	hand.frame=2
	hand.speed_scale=0

func physics_process_update(delta: float) -> void:
	if player.vine_fall:
		var dir:Vector2=Input.get_vector("move_left","move_right","jump","down")
		player.velocity=dir*vine_fall_speed*delta
	if not player.vine_fall:
		time+=delta
	if player.is_on_floor():
		state_machine.change_state("Idle")
		
	player.player_move_1(player.fall_gravity,delta)
	
## 退出状态
func exit() -> void:
	print("fall_lasting:",time)
	hand.speed_scale=1
	if time>extreme_speed:
		player.SPEED/=2
		await get_tree().create_timer(5).timeout
		player.SPEED*=2
	time=0.0

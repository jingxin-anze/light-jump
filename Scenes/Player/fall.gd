extends StateBase

@export var player: Player 
@export var vine_fall_speed:int=4500
@export var extreme_time:float=0.7
@export var death_time:float=0.92
var time:float
var is_to_death:bool=true

func enter() -> void:
	hand.animation="Jump"
	hand.speed_scale=0

func physics_process_update(delta: float) -> void:
	#根据下落的种类播放对应的动画
	if player.vine_fall:
		var dir:Vector2=Input.get_vector("move_left","move_right","jump","down")
		player.velocity=dir*vine_fall_speed*delta
		hand.animation="Attack2"
		hand.frame=2
	if not player.vine_fall:
		hand.animation="Jump"
		time+=delta
	#跳跃
	if player.cache_jump > 0 and player.coyote_time.time_left > 0:
		state_machine.change_state("Jump")
		return
	#状态切换
	if player.is_on_floor():
		if player.velocity.x == 0:
			state_machine.change_state("Idle")
		else:
			state_machine.change_state("Walk")
	#判断和死亡
	if time>death_time && is_to_death:
		is_to_death=false
		print("death")
		state_machine.change_state("Death")
	#处理移动
	player.player_move_1(player.fall_gravity,delta)
	
## 退出状态
func exit() -> void:
	#判断减速
	if time>extreme_time:
		player.SPEED/=2
		await get_tree().create_timer(5).timeout
		player.SPEED*=2
	hand.speed_scale=1
	print("下落持续时间为:",time)
	time=0.0

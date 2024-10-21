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
	#处理移动
	player.player_move_1(player.fall_gravity,delta)

## 退出状态
func exit() -> void:
	#判断大减速
	if time>death_time :
		player.SPEED/=4
		var timer:Timer=Timer.new()
		add_child(timer)
		timer.name="FallTimer"
		timer.start(5)
		timer.one_shot=true
		timer.timeout.connect(func(): 
			player.SPEED*=4
			timer.queue_free())
		print("大减速，下落时间为：",time)
		print("da",player.SPEED)
	#判断减速
	elif time>extreme_time:
		player.SPEED/=2
		var timer:Timer=Timer.new()
		add_child(timer)
		timer.name="FallTimer"
		timer.start(5)
		timer.one_shot=true
		timer.timeout.connect(func(): 
			player.SPEED*=2
			timer.queue_free())
		print("减速，下落时间为：",time)
		print("xiao",player.SPEED)
	else:
		print("下落时间为：",time)
	hand.speed_scale=1
	
	time=0.0

extends StateBase

@export var snake: Snake
@onready var detect_the_player: RayCast2D = $"../../DetectThePlayer"
@onready var ground_detection: RayCast2D = $"../../GroundDetection"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var attack_detection: RayCast2D = $"../../AnimatedSprite2D/AttackDetection"

@onready var right_wall_detection: RayCast2D = $"../../RightWallDetection"
@onready var left_wall_detection: RayCast2D = $"../../LeftWallDetection"

var player:Player

var is_on_floor = false  # 检测敌人是否在地面
var speed:int = 100
var gravity = 500.0 # 模拟重力
var direction:int = 1

func enter() -> void:
	player = get_tree().get_first_node_in_group("player")

func physics_process_update(delta: float) -> void:
	is_on_floor = ground_detection.is_colliding()
	
	if snake.position.y != player.position.y and snake.is_vine and !is_on_floor:
		state_machine.change_state("Cilmb")
	
	if snake.position.y > player.position.y and is_on_floor:
		state_machine.change_state("Jump")
			
			
	if player:
		if direction != sign(player.position.x - snake.position.x):
			filp()
		set_velocity(delta)
		
		if attack_detection.get_collider() is Player:
			state_machine.change_state("Attack")
		
		
## 退出状态
func exit() -> void:
	pass

#翻转
func filp() -> void:
	animated_sprite_2d.scale.x = -animated_sprite_2d.scale.x


# 设置移动变量	
func set_velocity(delta:float) -> void:
	direction = sign(player.position.x - snake.position.x)
	# print(direction)
	snake.velocity.x = direction * speed
	snake.velocity.y += gravity * delta
	

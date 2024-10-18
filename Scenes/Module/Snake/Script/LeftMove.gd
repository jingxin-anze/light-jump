extends StateBase

@export var snake: Snake
@onready var detect_the_player: RayCast2D = %DetectThePlayer
@onready var ground_detection: RayCast2D = $"../../GroundDetection"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var attack_detection: RayCast2D = $"../../AnimatedSprite2D/AttackDetection"

@onready var wall_detection_2: RayCast2D = $"../../AnimatedSprite2D/WallDetection/WallDetection2"
@onready var wall_detection: RayCast2D = $"../../AnimatedSprite2D/WallDetection"
@onready var vine_detection: RayCast2D = $"../../VineDetection"


var player:Player
var is_on_wall = false
@export var is_on_floor = false  # 检测敌人是否在地面
var is_on_vine = false
var speed:int = 100
var gravity = 500.0 # 模拟重力
var direction:int = 1

func enter() -> void:
	print("is move")
	player = get_tree().get_first_node_in_group("player")

func physics_process_update(delta: float) -> void:
	is_on_floor = ground_detection.is_colliding() 
	is_on_wall = wall_detection.is_colliding() or wall_detection_2.is_colliding()
	is_on_vine = vine_detection.is_colliding()
	
	if snake.position.y != player.position.y and snake.is_vine and !is_on_floor:
		state_machine.change_state("Cilmb")
		
	if snake.position.y > player.position.y and is_on_floor and is_on_wall:
		state_machine.change_state("Jump")
		
	if snake.position.y > player.position.y and is_on_floor and is_on_vine:
		state_machine.change_state("Jump")
	
	if player:
		set_velocity(delta)
		
		if attack_detection.get_collider() is Player:
			state_machine.change_state("Attack")
		
		
## 退出状态
func exit() -> void:
	pass

# 设置移动变量	
func set_velocity(delta:float) -> void:
	# print(direction)
	snake.velocity.x = snake.direction * speed
	snake.velocity.y += gravity * delta
	

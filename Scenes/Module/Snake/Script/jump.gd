extends StateBase

var player: Player 
@onready var detect_the_player: RayCast2D = %DetectThePlayer
@export var snake: Snake
@onready var ground_detection: RayCast2D = $"../../GroundDetection"


var jump_force = -300.0  # 跳跃力
var gravity = 500.0 # 模拟重力
var speed = 100 
func enter() -> void:
	#print("is jump")
	snake.velocity.y = jump_force

func physics_process_update(delta: float) -> void:	
	
	snake.velocity.y += gravity * delta
	snake.velocity.x = snake.direction * speed
	snake.velocity
	if ground_detection.is_colliding():
		state_machine.change_state("Move")
		
	if snake.is_vine:
		state_machine.change_state("Cilmb")
	

## 退出状态
func exit() -> void:
	snake.velocity.y = 0
	

	

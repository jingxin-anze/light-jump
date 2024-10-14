extends StateBase

@export var snake: Snake
@onready var detect_the_player: RayCast2D = $"../../DetectThePlayer"
@onready var ground_detection: RayCast2D = $"../../GroundDetection"


var player:Player

var is_on_floor = false  # 检测敌人是否在地面
var speed:int = 100
var gravity = 500.0 # 模拟重力
var direction:int = 1


func enter() -> void:
	player = get_tree().root.find_child("Player",true,false)

func physics_process_update(delta: float) -> void:
	#is_on_floor = ground_detection.is_colliding()
	
	if player:
		if direction != sign(player.position.x - snake.position.x):
			filp()
		
		set_velocity(delta)
	
	snake.move_and_slide()

## 退出状态
func exit() -> void:
	pass

#翻转
func filp() -> void:
	snake.scale.x = -snake.scale.x


# 设置移动变量	
func set_velocity(delta:float) -> void:
	direction = sign(player.position.x - snake.position.x)
	snake.velocity.x = direction * speed
	snake.velocity.y += gravity * delta
	

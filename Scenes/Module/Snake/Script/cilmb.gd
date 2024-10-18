extends StateBase

var player: Player 
@export var snake: Snake
@export var speed:float = 3000

@onready var ground_detection: RayCast2D = $"../../GroundDetection"
@onready var dir_up:Vector2 = Vector2(0,-1)
@onready var dir_dowm:Vector2 = Vector2(0,1)


func enter() -> void:
	player = get_tree().get_first_node_in_group("player")
	snake.set_collision_mask_value(3,false)

func physics_process_update(delta: float) -> void:	
	
	if snake.position.y > player.position.y:
		snake.velocity = dir_up * speed * delta
	elif snake.position.y < player.position.y:
		snake.velocity = dir_dowm * speed * delta
	else:
		snake.velocity = Vector2.ZERO  # 停止移动
		
	if ground_detection.is_colliding():
		state_machine.change_state("Move")
	
	
## 退出状态
func exit() -> void:
	snake.set_collision_mask_value(3,true)

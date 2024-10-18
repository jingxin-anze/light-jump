extends StateBase

var player: Player 
@export var snake: Snake
@export var speed:float = 3000

@onready var ground_detection: RayCast2D = $"../../GroundDetection"
@onready var dir:Vector2 = Vector2(0,-1)

@onready var detect_the_player: RayCast2D = %DetectThePlayer


func enter() -> void:
	snake.is_vine = true
	#print("in cilmb")
	player = get_tree().get_first_node_in_group("player")
	snake.set_collision_mask_value(3,false)
	if snake.position.y > player.position.y:
		dir = Vector2(0,-1)
	
	else:
		dir = Vector2(0,1)

func physics_process_update(delta: float) -> void:	
	
	snake.velocity = dir * speed * delta
		
	if ground_detection.is_colliding():
		state_machine.change_state("Move")
		
	if get_player_collide() is Player:
		state_machine.change_state("Jump")
	
	
	
## 退出状态
func exit() -> void:
	snake.set_collision_mask_value(3,true)
	snake.is_vine = false
	
func get_player_collide():
	return detect_the_player.get_collider()

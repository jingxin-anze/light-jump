extends StateBase

var player: Player 
@onready var detect_the_player: RayCast2D = %DetectThePlayer
@export var snake: Snake
var is_attack:bool = false
var direction:int = 1

func enter() -> void:
	player = get_tree().get_first_node_in_group("player")

func physics_process_update(delta: float) -> void:	
	if get_player_collide() is Player:
		is_attack = true
		state_machine.change_state("Move")
	
	if abs(snake.position.x - player.position.x) >5 and is_attack:
		if direction != sign(player.position.x - position.x):
			snake.filp()
			direction = -direction
		state_machine.change_state("Move")
## 退出状态
func exit() -> void:
	pass
	
func get_player_collide():
	return detect_the_player.get_collider()

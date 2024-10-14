extends StateBase

var player: Player 
@onready var detect_the_player: RayCast2D = $"../../DetectThePlayer"
@export var snake: Snake


var jump_force = -300.0  # 跳跃力


func enter() -> void:
	pass

func physics_process_update(delta: float) -> void:	
	snake.velocity.y = jump_force
	
	state_machine.change_state("Move")
	

## 退出状态
func exit() -> void:
	pass
	

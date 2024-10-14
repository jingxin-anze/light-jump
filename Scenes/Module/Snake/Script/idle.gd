extends StateBase

var player: Player 
@onready var detect_the_player: RayCast2D = $"../../DetectThePlayer"

func enter() -> void:
	pass

func physics_process_update(delta: float) -> void:	
	if get_player_collide() is Player:
		state_machine.change_state("Move")
	

## 退出状态
func exit() -> void:
	pass
	
func get_player_collide():
	return detect_the_player.get_collider()

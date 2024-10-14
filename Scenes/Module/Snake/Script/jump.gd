extends StateBase

var player: Player 
@onready var detect_the_player: RayCast2D = $"../../DetectThePlayer"

func enter() -> void:
	pass

func physics_process_update(delta: float) -> void:	
	pass
	

## 退出状态
func exit() -> void:
	pass
	

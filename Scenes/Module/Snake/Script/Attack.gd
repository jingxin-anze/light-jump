extends StateBase

var player: Player 
@onready var detect_the_player: RayCast2D = $"../../DetectThePlayer"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter() -> void:
	animated_sprite_2d.play("Attack")

func physics_process_update(delta: float) -> void:	
	if !animated_sprite_2d.is_playing():
		state_machine.change_state("Move")
	

## 退出状态
func exit() -> void:
	pass

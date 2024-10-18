extends CharacterBody2D
class_name Snake


@onready var state_machine: StateMachine = $StateMachine
@export var is_vine: bool = false

func _physics_process(delta: float) -> void:
	move_and_slide()
	
func _ready() -> void:
	state_machine.change_state("Idle")
	

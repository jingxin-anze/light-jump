extends CharacterBody2D
class_name Snake


@export var direction:int = 1
var player:Player
@onready var state_machine: StateMachine = $StateMachine
@export var is_vine: bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	
	if direction != sign(player.position.x - position.x):
		if abs(position.x - player.position.x) >50:
			filp()
			direction = -direction
	move_and_slide()
	
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	state_machine.change_state("Idle")
	
	
	
#翻转
func filp() -> void:
	animated_sprite_2d.scale.x = -animated_sprite_2d.scale.x
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.to_death = true

class_name Player
extends CharacterBody2D

@export var SPEED: float = 120.0
@export var jump_height: float = 85.0
@export var jump_time_to_peak: float = 0.5
@export var fall_time_to_peak: float = 0.4
@export var acceleration: float = 2000.0

var can_jump: bool = false

@onready var jump_velocity: float = (-2 * jump_height)/jump_time_to_peak
@onready var jump_gravity: float = (2 * jump_height)/(jump_time_to_peak * jump_time_to_peak)
@onready var fall_gravity: float = (2 * jump_height)/(fall_time_to_peak * fall_time_to_peak)

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var state_macine: StateMachine = $StateMacine

func _physics_process(delta: float) -> void:
	pass

func player_move_1(gravity: float, delta: float) -> void:
	#有时下落速度要加以限制
	#郊狼时间
	velocity.y += gravity * delta
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, acceleration*delta)
		if direction > 0:
			sprite_2d.flip_h = false
		elif direction < 0:
			sprite_2d.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration*delta)
	move_and_slide()

func player_move_2(delta: float) -> void:
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and can_jump:
		state_macine.change_state("Jump")

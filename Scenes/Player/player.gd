class_name Player
extends CharacterBody2D

@export var SPEED: float = 120.0
@export var jump_height: float = 85.0
@export var jump_time_to_peak: float = 0.5
@export var fall_time_to_peak: float = 0.4
@export var acceleration: float = 2000.0
@export var jump_event:String="jump"

var can_jump: bool = false
var direction:float

@onready var jump_velocity: float = (-2 * jump_height)/jump_time_to_peak
@onready var jump_gravity: float = (2 * jump_height)/(jump_time_to_peak * jump_time_to_peak)
@onready var fall_gravity: float = (2 * jump_height)/(fall_time_to_peak * fall_time_to_peak)

@onready var body: AnimatedSprite2D = $Body
@onready var state_macine: StateMachine = $StateMacine
@onready var right: RayCast2D = %Right
@onready var left: RayCast2D = %Left
@onready var hand: AnimatedSprite2D = %Hand


func _physics_process(_delta: float) -> void:
	fall_gravity=(2 * jump_height)/(fall_time_to_peak * fall_time_to_peak)
	if right.is_colliding() && right.get_collider().name=="Frog":
		if hand.animation=="Attack2" && hand.frame==2:
			var frog=right.get_collider()
			frog.position.x+=40
	if left.is_colliding() && left.get_collider().name=="Frog":
		if hand.animation=="Attack2" && hand.frame==2:
			var frog=right.get_collider()
			frog.position.x+=-40
		
		
func player_move_1(gravity: float, delta: float) -> void:
	#有时下落速度要加以限制
	#郊狼时间
	velocity.y += gravity * delta
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, acceleration*delta)
		if direction > 0:
			body.scale.x=abs(body.scale.x)
		elif direction < 0:
			body.scale.x=-abs(body.scale.x)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration*delta)
	move_and_slide()

func player_move_2(_delta: float) -> void:
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(jump_event) and can_jump:
		state_macine.change_state("Jump")

	if jump_event=="null" && event.is_action_pressed("jump") :
		var label=Label.new()
		add_child(label)
		label.text="!"
		label.position=Vector2(0,-40)
		label.modulate=Color.RED

		

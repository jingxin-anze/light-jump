class_name Player
extends CharacterBody2D

@export var SPEED: float = 120.0
@export var jump_height: float = 85.0
@export var jump_time_to_peak: float = 0.5
@export var fall_time_to_peak: float = 0.4
@export var acceleration: float = 2000.0
@export var jump_event:String="jump"
@export var can_fall:bool=true

var little_speed: bool = false
#var can_jump: bool = false
var direction:float
var vine_fall:bool
var cache_jump: int = 0
var to_death:bool
var is_on_cliff:bool

@onready var jump_velocity: float = (-2 * jump_height)/jump_time_to_peak
@onready var jump_gravity: float = (2 * jump_height)/(jump_time_to_peak * jump_time_to_peak)
@onready var fall_gravity: float = (2 * jump_height)/(fall_time_to_peak * fall_time_to_peak)


@onready var coyote_time: Timer = $CoyoteTime
@onready var body: AnimatedSprite2D = $Body
@onready var state_macine: StateMachine = $StateMacine
@onready var right: RayCast2D = %Right
@onready var left: RayCast2D = %Left
@onready var hand: AnimatedSprite2D = %Hand

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	#下落重力是否为零
	if can_fall:
		fall_gravity=(2 * jump_height)/(fall_time_to_peak * fall_time_to_peak)
	else:
		fall_gravity=0.0
	cache_jump -= 1
	cache_jump = clamp(cache_jump,0,6)
	if cache_jump == 0:
		little_speed = false
	
	if to_death:
		$StateMacine.change_state("Death")

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
	if event.is_action_pressed(jump_event):
		cache_jump = 6

	if event.is_action_released(jump_event):
		#if Player_life_died():
			#get_window().set_input_as_handled()
			#return
		if state_macine.current_state.state_index == 3 and self.velocity.y < jump_velocity/2:
			velocity.y = jump_velocity/2
		elif cache_jump > 0 and not state_macine.current_state.state_index == 3:
			little_speed = true

	if jump_event=="null" && is_on_cliff && event.is_action_pressed("jump") :
		var label=Label.new()
		add_child(label)
		label.text="!"
		label.position=Vector2(0,-40)
		label.modulate=Color.RED
	

		
		

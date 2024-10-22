extends AnimatedSprite2D

@export_enum("red", "green", "bule","1","2","3","4") var color:String
@export var turn_speed:float=1.0
@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")

var target_mirror:AnimatedSprite2D
var can_turn:bool

func _ready() -> void:
	for mirror in get_tree().get_nodes_in_group("oval_mirror"):
		if mirror.color==color:
			target_mirror=mirror
			
func _physics_process(delta: float) -> void:
	if can_turn:
		if Input.is_action_pressed("turn_left"):
			target_mirror.rotation_degrees-=turn_speed
		if Input.is_action_pressed("turn_right"):
			target_mirror.rotation_degrees+=turn_speed
		if Input.is_action_just_released("turn_left") or Input.is_action_just_released("turn_right"):
			%Crystal4.can_shoot=true

func _on_wheel_area_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		can_turn=true

func _on_wheel_area_body_exited(body: Node2D) -> void:
	if body.name=="Player":
		can_turn=false

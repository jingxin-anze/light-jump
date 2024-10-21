extends Node2D

@export var light_ball:PackedScene 
@export var can_shoot:bool=true
var light_ball_ins:CharacterBody2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if can_shoot:
		if is_instance_valid(light_ball_ins):
			light_ball_ins.is_free=true
		light_ball_ins=light_ball.instantiate()
		add_child(light_ball_ins)
		light_ball_ins.start(Vector2(0,0),degrees_to_radians(90),-90)
		can_shoot=false
	pass


func degrees_to_radians(degrees)->float:
	var radians = degrees * (PI / 180)
	return radians

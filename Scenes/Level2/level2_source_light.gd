##此脚本是调用光的脚本
extends Node2D

@export var light_ball:PackedScene 
@export var can_shoot:bool=true
var light_ball_ins:CharacterBody2D

#传入度数
@export var vector:int = 90

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if can_shoot:
		#若存在light_ball_ins则销毁
		if is_instance_valid(light_ball_ins):
			light_ball_ins.is_free=true
		#生成light_ball_ins
		light_ball_ins=light_ball.instantiate()
		add_child(light_ball_ins)
		#初始化
		light_ball_ins.start(Vector2(0,0),degrees_to_radians(vector))
		can_shoot=false
	pass


func degrees_to_radians(degrees)->float:
	var radians = degrees * (PI / 180)
	return radians

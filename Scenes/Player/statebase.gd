class_name StateBase
extends Node2D

var state_machine: StateMachine
@export var body:AnimatedSprite2D
@export var hand:AnimatedSprite2D
@export var state_index: int
## 进入状态
func enter() -> void:
	pass

## 渲染帧触发
#func process_update(delta: float) -> void:
	#pass

## 物理帧触发
func physics_process_update(delta: float) -> void:
	pass

## 退出状态
func exit() -> void:
	pass

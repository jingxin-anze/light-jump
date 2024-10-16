extends StaticBody2D

@export var ss: bool = true##该按钮是否可以旋转

func _physics_process(delta: float) -> void:
	if ss:
		var s: = Input.get_axis("ui_left","ui_right")#获取玩家的输入，左为负，右为正
		if s > 0:
			rotation += 0.01
			GameHuayu.routationed.emit()
		elif s < 0:
			rotation -= 0.01
			GameHuayu.routationed.emit()

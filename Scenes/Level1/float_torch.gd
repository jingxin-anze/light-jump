extends Node2D

var player_body:AnimatedSprite2D
var	audio:AudioStreamPlayer
var can_tween:bool=true
var current_tween:bool
var current_body_scale:float

const FIRE = preload("res://Asset/Sounds/Level1/fire.MP3")

func _ready() -> void:
	player_body=get_tree().get_first_node_in_group("player").get_node("Body")
	audio=AudioPlayer.play(FIRE,true,false,20)
	AudioPlayer.pause(audio)
	float_in_air()

#浮动灯光
func float_in_air():
	#创建Tween
	var t:Tween=create_tween()
	#设置循环
	t.set_loops()
	#移动
	t.tween_property(self,"position:y",position.y+6,3)
	t.tween_property(self,"position:y",position.y+-6,3)

func _physics_process(_delta: float) -> void:
	if player_body.scale.x!=current_body_scale:
		var tween=create_tween()
		if player_body.scale.x>0:
			current_body_scale=player_body.scale.x
			tween.tween_property(self,"position:x",13,2)
			await tween.finished
		else:
			current_body_scale=player_body.scale.x
			tween.tween_property(self,"position:x",-14,2)
			await tween.finished
		
		#printt("bianliang:",current_body_scale)
		#printt("self:",player_body.scale.x)

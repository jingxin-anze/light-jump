extends Node2D

@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")

var body:AnimatedSprite2D
var	audio:AudioStreamPlayer
const FIRE = preload("res://Asset/Sounds/Level1/fire.MP3")

func _ready() -> void:
	audio=AudioPlayer.play(FIRE,true,false,20)
	AudioPlayer.pause(audio)
	body=player.get_node("Body")


func _physics_process(_delta: float) -> void:
	#print(hand.scale.x)
	if body.scale.x>0:
		position=Vector2(-4,2)
	else:
		position=Vector2(4.5,2)

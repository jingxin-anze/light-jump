extends RigidBody2D

const SCRAPE = preload("res://Asset/Sounds/Level1/scrape.MP3")

@export var level1:bool=true
var level1_shoot:bool=true

@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")


@export var init_position:Vector2=Vector2(1447,939)

func _physics_process(delta: float) -> void:
	if level1:
		if self.global_position.x<200:
			player.to_death=true
			#death_ui.get_node("TextureRect/YouDie").text="青蛙罢工了"
		if self.global_position.x>2300 and level1_shoot:
			%SunRayManager.can_shoot=true
			level1_shoot=false

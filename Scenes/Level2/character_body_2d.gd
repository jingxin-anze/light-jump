extends CharacterBody2D

enum State{flay,idle,reading}

var dir:Vector2

@export var speed:float=100
@export var state:int=State.idle

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	match state:
		State.idle:
			anim.play("Idle")
		State.flay:
			anim.play("Flay")
			flay_state(delta)
		State.reading:
			anim.play("Reading")
			reading_state()
	pass

func _on_checker_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		state=State.flay

func flay_state(dt):
	dir=-(self.position-player.position).normalized()
	velocity=dir*speed*dt
	move_and_collide(velocity)
	pass

func reading_state():
	pass

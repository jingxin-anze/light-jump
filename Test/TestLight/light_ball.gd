extends CharacterBody2D

@export var speed:int= 700

func _ready() -> void:
	var line:Line2D=preload("res://Test/TestLight/line_2d.tscn").instantiate()
	get_parent().add_child(line)
	line.target=self
	await  get_tree().create_timer(5).timeout
	line.queue_free()
	queue_free()
	
func start(pos,rotat):
	rotation = rotat
	position =pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

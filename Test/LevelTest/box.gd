extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Left.is_colliding() && $Left.get_collider().name=="Player":
		self.position.x+=-2
	if $Right.is_colliding() && $Right.get_collider().name=="Player":
		self.position.x+=2

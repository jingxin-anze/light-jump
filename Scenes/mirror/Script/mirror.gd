extends RigidBody2D


var new_position: Vector2 = self.position
var night_ball:Night
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	night_ball = get_tree().get_first_node_in_group("night_ball")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if new_position != position:
		night_ball.can_shoot = true
	new_position = position
	


func _on_body_entered(body: Node) -> void:
	print("qwe")
	

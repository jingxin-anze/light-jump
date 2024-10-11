extends StaticBody2D

var player:CharacterBody2D
var hand:AnimatedSprite2D
func _ready() -> void:
	player=get_tree().get_first_node_in_group("player")
	hand=player.get_node("Body/Hand")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Left.is_colliding() && $Left.get_collider().name=="Player":
		if hand.animation=="Atack2" && hand.frame==2:
			self.position.x+=38

	if $Right.is_colliding() && $Right.get_collider().name=="Player":
		if hand.animation=="Atack2" && hand.frame==2:
			self.position.x+=-38

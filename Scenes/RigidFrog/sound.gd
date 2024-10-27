extends Area2D

const FROG = preload("res://Asset/Sounds/Level1/frog.mp3")
var audio:AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		audio=AudioPlayer.play(FROG,true,false,2)
		audio.pitch_scale=0.6
		
func _on_body_exited(_body: Node2D) -> void:
	if is_instance_valid(audio):
		AudioPlayer.destroy(audio)
		
func _physics_process(delta: float) -> void:
	if is_instance_valid(audio):
		audio.pitch_scale=0.6

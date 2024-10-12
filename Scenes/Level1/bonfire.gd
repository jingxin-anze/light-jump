extends Node2D

const FIRE_LARGE = preload("res://Asset/Sounds/Level1/fire_large.mp3")
var audio:AudioStreamPlayer


#进入小区域显示悬浮火炬
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		$"../../Player/TestScenc".visible=true
		AudioPlayer.contine($"../../Player/TestScenc".audio)
		get_node("Area2D").call_deferred("queue_free")

#离开区域销毁播放器
func _on_sound_free_body_exited(body: Node2D) -> void:
	if body.name=="Player":
		if is_instance_valid(audio):
			AudioPlayer.destroy(audio)

#进入区域创建播放器
func _on_sound_free_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		audio=AudioPlayer.play( FIRE_LARGE,true,false,20)
		audio.name="火堆燃烧声"
		pass

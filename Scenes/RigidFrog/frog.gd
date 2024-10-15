extends RigidBody2D

const SCRAPE = preload("res://Asset/Sounds/Level1/scrape.MP3")

func _ready() -> void:
	pass

#播放完音频自动销毁
func sound_play()->void:
	AudioPlayer.play(SCRAPE,false,true,7)

extends RigidBody2D

const SCRAPE = preload("res://Asset/Sounds/Level1/scrape.MP3")

@export var level1:bool=true
var level1_shoot:bool=true

@export var init_position:Vector2=Vector2(1447,939)

func _ready() -> void:
	pass

#播放完音频自动销毁
func sound_play()->void:
	AudioPlayer.play(SCRAPE,false,true,7)
	
func _physics_process(delta: float) -> void:
	if level1:
		if self.global_position.x<200:
			self.global_position=init_position
		if self.global_position.x>2300 and level1_shoot:
			%SunRayManager.can_shoot=true
			level1_shoot=false

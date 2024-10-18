extends Control

func _ready() -> void:
	self.modulate.a=0
	var t:Tween=get_tree().create_tween()
	t.tween_property(self,"modulate:a",1,5)

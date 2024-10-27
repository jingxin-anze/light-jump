extends Button

var show:Texture2D=preload("res://Asset/Pics/UI_Phone/Phone.png")
var hide:Texture2D=preload("res://Asset/Pics/UI_Phone/Phone_Pressed.png")

func _on_pressed() -> void:
	%CanvasGroup.visible=!%CanvasGroup.visible
	if %CanvasGroup.visible:
		self.icon=show
	else:
		self.icon=hide

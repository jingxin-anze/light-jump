extends Control



func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.is_pressed():
		self.queue_free()

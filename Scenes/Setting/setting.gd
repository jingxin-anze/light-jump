extends Control

@onready var h_slider: HSlider = %HSlider
@onready var resolution: OptionButton = $CanvasLayer/Resolution

var resolution_dir:Dictionary={
	"3840x2160": Vector2i(3840 ,2160),
	"2560x1440": Vector2i( 2560,1440),
	"1800x1000":Vector2i( 1800,1000),
	"1920x1080": Vector2i(1920,1080) ,
	"1366x768": Vector2i (1366,768),
	"1280x720": Vector2i(1280, 720) ,
	"1440x900": Vector2i(1440,900) ,
	"1600x900":Vector2i (1600,900),
	"1024x600": Vector2i(1024, 600) ,
	"800x600": Vector2i(800, 600) ,
}
const LEVEL_1_ECHOES_IN_THE_NIGHT = preload("res://Asset/Sounds/Level1/Level 1_Echoes in the Night.mp3")


func _ready() -> void:
	AudioPlayer.play(LEVEL_1_ECHOES_IN_THE_NIGHT)
	h_slider.value=AudioPlayer.get_volume(0)
	add_resolution()
	render_current_resolution()
	

func _on_h_slider_value_changed(value: float) -> void:
	AudioPlayer.set_volume(0,value)
	

func add_resolution():
	for i in resolution_dir:
		resolution.add_item(i)

func render_current_resolution():
	var current_resolution:String=str(get_viewport().size.x,"x",get_viewport().size.y)
	var resolution_key=resolution_dir.keys().find(current_resolution)
	resolution.selected=resolution_key

func _on_resolution_item_selected(index: int) -> void:
	var key=resolution.get_item_text(index)
	get_window().set_size(resolution_dir[key])


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.is_pressed():
		self.queue_free()

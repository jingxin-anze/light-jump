extends Control

#引用节点
@onready var h_slider: HSlider = %HSlider
@onready var resolution: OptionButton = %Resolution

#列出分辨率
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

#引入测试声音
const LEVEL_1_ECHOES_IN_THE_NIGHT = preload("res://Asset/Sounds/Level1/Level 1_Echoes in the Night.mp3")

#初始化
func _ready() -> void:
	#播放音频
	AudioPlayer.play(LEVEL_1_ECHOES_IN_THE_NIGHT)
	#将总音量传入value
	h_slider.value=AudioPlayer.get_volume(0)
	#初始化OptionButton的item
	add_resolution()
	#显示当前的分辨率
	render_current_resolution()
	
#随着滑块的变化改变音量
func _on_h_slider_value_changed(value: float) -> void:
	AudioPlayer.set_volume(0,value)
	

func add_resolution():
	#遍历字典
	for i in resolution_dir:
		#添加进item
		resolution.add_item(i)

#显示当前的分辨率
func render_current_resolution():
	var current_resolution:String=str(get_viewport().size.x,"x",get_viewport().size.y)
	#在字典中寻找对应的分辨率
	var resolution_key=resolution_dir.keys().find(current_resolution)
	#改变显示
	resolution.selected=resolution_key

#选择不同的分辨率产生相应的变化
func _on_resolution_item_selected(index: int) -> void:
	#根据索引获得键
	var key=resolution.get_item_text(index)
	#通过键对应的值修改分辨率
	get_window().set_size(resolution_dir[key])

#若点击空白处，则销毁此场景
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT and event.is_pressed():
		self.queue_free()

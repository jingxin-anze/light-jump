extends PointLight2D

# 亮度范围
@export var min_energy: float = 0.8
@export var max_energy: float = 2
# 调整火光变化的速度

@export var flicker_speed: float = 0.3

func _ready():
	# 开始火光变化的过程
	flicker()

# 创建一个火光随机变化的过程
func flicker():
	var target_energy = randf_range(min_energy, max_energy)
	# 使用 Tween 或线性插值来过渡到新的亮度
	tween_to_energy(target_energy)

# 逐渐改变亮度值
func tween_to_energy(target_energy):
	var current_energy = self.energy
	# 使用线性插值逐渐变化
	var new_energy = lerp(current_energy, target_energy, flicker_speed)
	self.energy = new_energy
	# 再次调用 flicker 模拟持续变化
	await get_tree().create_timer(0.1).timeout
	flicker()

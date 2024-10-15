extends Node2D

@export var max_reflections = 3 #最大折射次数，也就是新生成Raycast的次数
var direction = Vector2.RIGHT   # 折射之后的方向
@onready var ray: RayCast2D = $"../RayCast2D"
@onready var line_2d: Line2D = $"../Line2D"

@onready var points_range = [] # 存储生成光线的点位

var is_update = false 

func _ready():
	points_range.append(ray.position)
	
func _physics_process(delta):
	# 获取碰撞点
	var collision_point = ray.get_collision_point()
	
	points_range.append(collision_point)
	
	# 获取碰撞法线
	var normal = ray.get_collision_normal()
	# 使用 bounce 函数计算反射方向
	direction = direction.bounce(normal.normalized())

	# 用碰撞的点位加上方向x距离
	var target_point = collision_point + direction * 50000
	points_range.append(target_point)

	
	
	#update_line()
	if !is_update:
		update_line()
		is_update= true

#绘制点位
func update_line() -> void:
	line_2d.clear_points()
	for i in range(points_range.size()):
		line_2d.add_point(points_range[i])

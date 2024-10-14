extends RayCast2D

@export var max_reflections = 3  # 最大反射次数
var current_reflections = 0  # 当前反射计数

func _ready():
	enabled = true

func _physics_process(delta):
	# 首先重置光线的碰撞计数
	current_reflections = 0
	
	# 循环检查光线的反射
	var start_pos = global_position
	var direction = global_transform.x
	for i in range(max_reflections):
		if is_colliding():
			# 获取碰撞点
			var collision_point = get_collision_point()
			# 获取碰撞法线
			var normal = get_collision_normal()
			# 使用 bounce 函数计算反射方向
			direction = direction.bounce(normal)
			
			# 在碰撞点更新光线
			start_pos = collision_point
			# 递增反射计数
			current_reflections += 1
			
			# 重置 RayCast 的起点
			global_position = start_pos
			target_position = direction * 500  # 光线长度
			force_raycast_update()
		else:
			break

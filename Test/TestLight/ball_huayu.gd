class_name Ball
extends Node2D

@export var ray_array: Array[RayCast2D] 
@export var points_range: Array[Vector2]
@export var ray_size: int = 15 ##最多有ray_size-1条线，ray_size-2反射

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var line_2d: Line2D = $Line2D

func _ready() -> void:
	#下列for循环是初始化
	for i in ray_size:
		if i == 0:
			ray_array.append(ray_cast_2d)
			continue
		var s = RayCast2D.new()
		s.position = Vector2(0,0)
		s.target_position = Vector2(0,0)
		add_child(s)
		ray_array.append(s)
	_start_list()
	#玩家每次调整镜子的角度时就会调用_start_list()
	GameHuayu.routationed.connect(_start_list)

func _start_list() -> void:
	for i in ray_array.size():
		if i == 0:
			continue
		ray_array[i].position = Vector2(0,0)
		ray_array[i].target_position = Vector2(0,0)
	points_range.clear()
	points_range.append(Vector2(0,0))
	_update_list(0)

func _update_list(s: int = 0) -> void:
	#立刻重置放射检测
	ray_array[s].force_raycast_update()
	#最后一次调用，即该次不会碰撞到东西或者反射的次数过多了
	if not ray_array[s].is_colliding() or s >= ray_size-2:
		points_range.append(points_range[s] + ray_array[s].target_position)
		#最后一次再更新光线轨迹
		_updae_line()
		return
	else:
		#获得放射检测碰撞点，但是此碰撞点会向碰撞射线的方向移动一个单位向量，因为如果不加会出现bug，不信你可以试试，该bug原因应该是因为第二个放射检测刚开始就碰到了一个刚体从而就结束了
		var collision_point = ray_array[s].get_collision_point() - ray_array[s].target_position.normalized()
		#获得点的距离
		points_range.append(collision_point - global_position)
		var direction: Vector2 = ray_array[s].target_position.normalized()
		# 获取碰撞法线
		var normal = ray_array[s].get_collision_normal()
		# 使用 bounce 函数计算反射方向
		direction = direction.bounce(normal.normalized())
		ray_array[s+1].target_position = direction * 1000
		ray_array[s+1].position = collision_point - global_position
		_update_list(s+1)
#绘制轨迹函数
func _updae_line() -> void:
	line_2d.clear_points()
	for i in points_range:
		line_2d.add_point(i)

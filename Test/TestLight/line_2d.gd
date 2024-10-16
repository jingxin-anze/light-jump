extends Line2D
#定义points数组里最多能有多少个点
@export var max_points:int=220
#定义目标（目标就是球）
var target:CharacterBody2D

func _ready() -> void:
	await  get_tree().create_timer(0.1).timeout
	#$PointLight2D.position=points[0]

	$PointLight2D.rotation_degrees=14.0
	#$PointLight2D.position.x=900
	#$PointLight2D.
	pass


func _physics_process(delta: float) -> void:
	
	if points.size()<=max_points:
		#若target存在则根据target的位置动态生成点
		if is_instance_valid(target):
			add_point(target.position)
	#若点多余max_points则删除
	else:
		points.remove_at(0)
		

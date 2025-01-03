extends Line2D
#定义points数组里最多能有多少个点
@export var max_points:int=220
#光旋转的角度
@export var light_degrees:float=14
#定义目标（目标就是球）
var target:CharacterBody2D

func _ready() -> void:
	add_point(position)
	await  get_tree().create_timer(0.1).timeout
	pass

func _physics_process(_delta: float) -> void:
	
	if points.size()<=max_points:
		#若target存在则根据target的位置动态生成点
		if is_instance_valid(target):
			add_point(target.position)
	#若点多余max_points则删除
	else:
		points.remove_at(0)
		

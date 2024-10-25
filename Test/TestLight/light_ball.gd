extends CharacterBody2D

class_name LightBall
#定义球的速度
@export var speed:int= 20000
var line:Line2D
var is_free:bool

#在ready完成的时候加载line
func _ready() -> void:
	#实例化line
	line=preload("res://Test/TestLight/line_2d.tscn").instantiate()
	#将其置于父节点下
	get_parent().add_child(line)
	#设置line的target为自身
	line.target=self
	#存在五秒则自动销毁
	await  get_tree().create_timer(10).timeout
	speed=0
	velocity=Vector2.ZERO


#初始化角度和自身的位置
func start(pos,rotat):
	rotation = rotat
	position =pos
	#速度为自身速度旋转rotation角度
	velocity = Vector2(speed, 0).rotated(rotation)


func _physics_process(delta):
	#获取物理体
	var collision = move_and_collide(velocity * delta)
	#若检测到物理体
	if collision:
		#根据物理体的法线反弹
		velocity = velocity.bounce(collision.get_normal())

		if collision.get_collider() is TileMapLayer:
			velocity=Vector2(0,0)
			
		if collision.get_collider().has_meta("is_black_platform"):
			collision.get_collider().get_parent().modulate=Color.BROWN
			collision.get_collider().collision_layer=16
			velocity=Vector2(0,0)

	if is_free:
		line.queue_free()
		queue_free()

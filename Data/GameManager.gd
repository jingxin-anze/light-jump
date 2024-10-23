class_name GameData extends Resource

"""
1.在开始场景加载完毕后创建存档文件。
2.在第一关加载完毕后，保存level==level1
3.在第一关的切换场景脚本中，保存is_new_start和is_contine_disabled
并且初始化第二关的位置
4.在第二关加载完毕后，保存level==level2
5.在到达存档点时，保存achieve_point
6.death_ui里
"""

#开始游戏和继续游戏
@export var is_new_start:bool
@export var is_contine_disabled:bool=true
#关卡进度
@export_enum("level1","level2","level3") var level:String
#关卡存档点
@export var achieve_point:Dictionary=\
{"player_position":Vector2(0,0),"player_body_scale":1}

@export var test:int=1

##可以全局播放音乐，不受场景变换的影响
class_name Audio extends Node

##播放音频
func play(stream:AudioStream, single:bool=false,is_release:bool=true,volume:float=0,) -> AudioStreamPlayer:
	if single:
		# 获取所有的audio节点，若音频资源相同则return该节点
		var audio_list = get_children()
		for audio_node: AudioStreamPlayer in audio_list:
			if audio_node.stream.resource_path == stream.resource_path:
				audio_node.stream_paused=false
				return audio_node
				
	#创建播放器
	var audio=AudioStreamPlayer.new()
	#调节音量
	audio.volume_db=volume
	#传入音频资源
	audio.stream=stream
	#连接finished方法，绑定两个参数
	audio.finished.connect(finished.bind(audio,is_release))
	#添加到场景树中
	add_child(audio)
	#开始播放
	audio.playing=true
	#返回播放音频的节点
	return audio

##暂停音频播放
func pause(audio):
	audio.stream_paused=true

##继续播放音频
func contine(audio):
	audio.stream_paused=false

##清除特定播放器
func destroy(audio):
	audio.stop()
	audio.queue_free()

#此函数的参数是在连接信号的的时候传入的
##音乐播放完自动执行
func finished(audio,is_release):
	if is_release:
		audio.queue_free()
	audio.play()

##清除所有播放器
func clear():
	#从后向前销毁播放器
	if not get_children().is_empty():
		var count=get_child_count()
		for i in range(count):
			var child=get_child(count-i-1)
			child.queue_free()
	else:
		return

#下面两个方法是对所有声音大小的调整
##获取当前线程的线性音量 
func get_volume(bus_index:int):
	#获得当前总线的音量值
	var db:=AudioServer.get_bus_volume_db(bus_index)
	#返回线性音量值
	return db_to_linear(db)

##需要注意传入的值是线性的。
func set_volume(bus_index:int,v:float):
	#将线性音量值转为db
	var db:=linear_to_db(v)
	#设置音量值
	AudioServer.set_bus_volume_db(bus_index,db)

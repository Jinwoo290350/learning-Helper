extends Node2D
@onready var input : AudioStreamPlayer = $input
var index : int
var effect : AudioEffectCapture
var playback : AudioStreamGeneratorPlayback
@export var outputPath : NodePath
var inutThreshols = 0.005
func _ready():
	pass

func setupAudio(id):
	set_multiplayer_authority(id)
	if is_multiplayer_authority():
		input.stream = AudioStreamMicrophone.new()
		input.play()
		index = AudioServer.get_bus_index("record")
		effect = AudioServer.get_bus_effect(index,0)
		
	playback = get_node(outputPath).get_stream_playback()
	
func _process(delta):
	if is_multiplayer_aurthorty():
		processMic()
	pass
	
func processMic():
	var SterioData : PackedVecter2Array = effect.get_buffer(effect.get_fraes_available())
	if SterioData.size()>0:
		var data = PackedFloat32Array()
		data.resize(sterioData.size())
		var maxAnplitude :=0.0
		
		for i in range(sterioData.size()):
			var value = (sterioData[i].x + sterioData[i].y) / 2
			maxApplitude = max(value,maxAnplitude)
			data[i] = value
		if maxAnplitude < inputThreshold:
			return 

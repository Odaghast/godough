extends Node3D

#Must be added to the Globals AutoLoad section of project settings
#OR
#Provide this script a class name and manually add it to the Scene Tree
#I suggest option 1

static var SFX_BUS : String = "SFX";

func playSFXGlobal(sound : AudioStream, pitch : float = 1.0) -> AudioStreamPlayer:
	var _player : AudioStreamPlayer = AudioStreamPlayer.new();
	add_child(_player);
	
	_player.finished.connect(_player.queue_free);
	
	_player.bus = SFX_BUS;
	_player.stream = sound;
	_player.pitch_scale = pitch;
	_player.play();
	
	return _player;

func playSFXGlobalRand(sounds : Array, pitch : float = 1.0) -> AudioStreamPlayer:
	return playSFXGlobal(sounds.pick_random(), pitch);

func playSFX(sound : AudioStream, positionIn : Vector3, pitch : float = 1.0) -> AudioStreamPlayer3D:
	var _player : AudioStreamPlayer3D = AudioStreamPlayer3D.new();
	add_child(_player);
	
	_player.finished.connect(_player.queue_free);
	
	_player.bus = SFX_BUS;
	_player.stream = sound;
	_player.pitch_scale = pitch;
	_player.position = positionIn;
	_player.play();
	
	return _player;

func playSFXRand(sounds : Array, positionIn : Vector3, pitch : float = 1.0) -> AudioStreamPlayer3D:
	return playSFX(sounds.pick_random(), positionIn, pitch);
	

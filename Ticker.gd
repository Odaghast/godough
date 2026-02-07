extends Object
class_name Ticker

var _time : float = -1.0;
var _setTime : float = 0.0;

func _init(time : float, beginStopped : bool = true) -> void:
	_setTime = time;
	_time = -1.0 if beginStopped else time;

func tick(delta : float) -> bool:
	if isStopped(): return false;
	
	_time -= delta;
	if _time <= 0.0:
		stop();
		return true;
	
	return false;

func stop() -> void: _time = -1.0;
func isStopped() -> bool: return _time == -1.0;
func isTicking() -> bool: return _time > -1.0;
func start() -> void: _time = _setTime;
func setTime(time : float) -> void: _setTime = time;
func getTime() -> float: return _time;
func getPercent() -> float: return _time/_setTime;

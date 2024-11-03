extends Sprite2D

var clicks = 0
var counterLabel : Label
var isClickable = true
var timer = null
var clickDelay = 0.1
var tween : Tween
var botDelay = 1

var clickTimer = null

var acaCount = 0
var comsCount = 0
var wicCount = 0
var mbaCount = 0
var lasaCount = 0



func _ready():
	counterLabel = get_node("../Counter")
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(clickDelay)
	timer.connect("timeout", Callable(self, "on_timeout_complete"))
	add_child(timer)
	
	clickTimer = Timer.new()
	clickTimer.set_one_shot(true)
	clickTimer.set_wait_time(botDelay)
	clickTimer.connect("timeout", Callable(self, "on_clicktime_complete"))
	add_child(clickTimer)
	
	clickTimer.start()
	
func _process(delta: float) -> void:
	counterLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	counterLabel.text = "Volunteers:\n" + str(clicks)
	pass

func _input(event):
	if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT && isClickable && not $"../Menu".menuOn):
		if get_rect().has_point(to_local(event.position)):
			clicks += (1 + acaCount + comsCount + wicCount + mbaCount + lasaCount)
			animate_click()
			isClickable = false
			timer.start()
	elif (event.is_action_pressed("CookieClick") && isClickable && not $"../Menu".menuOn):
		clicks += (1 + acaCount + comsCount + wicCount + mbaCount + lasaCount)
		animate_click()
		isClickable = false
		timer.start()

func animate_click():
	tween = create_tween()
	
	tween.tween_property(self, "scale", self.scale * Vector2(0.9, 0.9), 0.04).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", self.scale, 0.04 ).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

func on_timeout_complete():
	isClickable = true;
	
func on_clicktime_complete():
	clicks += acaCount + (comsCount*10) + (wicCount * 100) + (mbaCount * 1000) + (lasaCount * 10000)
	clickTimer.start()
		  

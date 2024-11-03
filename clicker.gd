extends Sprite2D

var clicks = 0
var counterLabel : Label
var isClickable = true
var timer = null
var clickDelay = 0.1
var tween : Tween



func _ready():
	counterLabel = get_node("../Counter")
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(clickDelay)
	timer.connect("timeout", Callable(self, "on_timeout_complete"))
	add_child(timer)
func _input(event):
	if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT && isClickable):
		if get_rect().has_point(to_local(event.position)):
			clicks += 1
			counterLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			counterLabel.text = "Volunteers:\n" + str(clicks)
			animate_click()
			isClickable = false
			timer.start()
	elif (event.is_action_pressed("CookieClick") && isClickable):
		clicks += 1
		counterLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		counterLabel.text = "Volunteers:\n" + str(clicks)
		animate_click()
		isClickable = false
		timer.start()

func animate_click():
	tween = create_tween()
	
	tween.tween_property(self, "scale", self.scale * Vector2(0.9, 0.9), 0.04).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", self.scale, 0.04 ).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

func on_timeout_complete():
	isClickable = true;
	
		  

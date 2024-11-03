extends Sprite2D

var menuOn = false;
var menuTween : Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
func _input(event):
	if event.is_action_pressed("Menu"):
		if not menuOn:
			menuOn = true
			menuSlideOn()
		else:
			menuOn = false
			menuSlideOff()
		
func menuSlideOn():
	menuTween = create_tween()
	menuTween.tween_property(self, "position", Vector2(1597, 542), 0.4).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

		
func menuSlideOff():
	menuTween = create_tween()
	menuTween.tween_property(self, "position", Vector2(2140, 542), 0.4).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

		

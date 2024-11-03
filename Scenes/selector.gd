extends Sprite2D

var aca = true
var acaPrice = 30
var coms = false
var comsPrice = 300
var wic = false
var wicPrice = 5000
var mba =  false
var mbaPrice = 10000
var lasa = false
var lasaPrice = 100000


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	#THIS IS LASA NOW
	if aca:
		self.position = Vector2(-14,-272)
		if $"..".menuOn:
			if event.is_action_pressed("menuUp"):
				lasa = true
				aca = false
			elif event.is_action_pressed("menuDown"):
				coms = true
				aca = false
				
			elif event.is_action_pressed("CookieClick") && $"../../Clicker".clicks >= acaPrice:
				$"../../Clicker".clicks -=acaPrice
				$"../../Clicker".acaCount +=1
				acaPrice *= 1.3
				acaPrice = round(acaPrice)
	#THIS IS MBA NOW
	elif coms:
		self.position = Vector2(-15,-149)
		if $"..".menuOn:
			if event.is_action_pressed("menuUp"):
				aca = true
				coms = false
			elif event.is_action_pressed("menuDown"):
				wic = true
				coms = false
			elif event.is_action_pressed("CookieClick") && $"../../Clicker".clicks >= comsPrice:
					$"../../Clicker".clicks -=comsPrice
					$"../../Clicker".comsCount +=1
					comsPrice *= 1.5
					comsPrice = round(comsPrice)
	# THIS IS COMS NOW
	elif wic:
		self.position = Vector2(-16,-25)
		if $"..".menuOn:
			if event.is_action_pressed("menuUp"):
				coms = true
				wic = false
			elif event.is_action_pressed("menuDown"):
				mba = true
				wic= false
			elif event.is_action_pressed("CookieClick") && $"../../Clicker".clicks >= wicPrice:
					$"../../Clicker".clicks -=wicPrice
					$"../../Clicker".wicCount +=1
					wicPrice *= 1.5
					wicPrice = round(wicPrice)
	#THIS IS WIC NOW
	elif mba:
		self.position = Vector2(-12,100)
		if $"..".menuOn:
			if event.is_action_pressed("menuUp"):
				wic = true
				mba = false
			elif event.is_action_pressed("menuDown"):
				lasa = true
				mba = false
			elif event.is_action_pressed("CookieClick") && $"../../Clicker".clicks >= mbaPrice:
					$"../../Clicker".clicks -=mbaPrice
					$"../../Clicker".mbaCount +=1
					mbaPrice *= 1.5
					mbaPrice = round(mbaPrice)
	#THIS IS ACA NOW
	elif lasa:
		self.position = Vector2(-12,224)
		if $"..".menuOn:
			if event.is_action_pressed("menuUp"):
				mba = true
				lasa = false
			elif event.is_action_pressed("menuDown"):
				aca = true
				lasa = false
			elif event.is_action_pressed("CookieClick") && $"../../Clicker".clicks >= lasaPrice:
					$"../../Clicker".clicks -=lasaPrice
					$"../../Clicker".lasaCount +=1
					lasaPrice *= 1.5
					lasaPrice = round(lasaPrice)

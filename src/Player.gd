extends KinematicBody2D

export var speed = 100 
var screen_size
var power = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("gravity_flip"):
		if position.y > 500:
			position.y = 82
		else:
			position.y = 523
	

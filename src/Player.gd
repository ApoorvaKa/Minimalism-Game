extends KinematicBody2D

export var speed = 100 
var screen_size
var power = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # set velocity to (0,0)
	if Input.is_action_just_pressed("gravity_flip"):
		if position.y > 500:
			position.y = 82
		else:
			position.y = 523
	
	velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	# handles the movement of the player
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x) # clamp to keep it within the screen
	position.y = clamp(position.y, 0, screen_size.y)
	

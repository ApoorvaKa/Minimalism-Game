extends KinematicBody2D

export var speed = 200 
var screen_size
var power = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_just_released("click"):
		velocity.y -= power;
	if Input.is_action_pressed("click"):
		power += 1
		
	
	if velocity.length() > 0:
		velocity = velocity * speed
	# handles the movement of the player
	position += velocity * delta
	
	position.x = clamp(position.x, 0, screen_size.x) # clamp to keep it within the screen
	position.y = clamp(position.y, 0, screen_size.y)
	

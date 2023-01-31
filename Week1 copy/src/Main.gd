extends Node

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game() # will be removed with HUD implementation

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	$ScoreTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	
func _on_ScoreTimer_timeout():
	score += 1

func _on_StartTimer_timeout():
	$ScoreTimer.start()

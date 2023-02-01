extends Node

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over()
	get_tree().call_group("enemies", "queue_free")
	$Spawner/Spawn_Timer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$Spawner.nextSpawnTime = 4.0
	$StartTimer.start()
	$Spawner/Spawn_Timer.start($Spawner.nextSpawnTime)
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	
func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_StartTimer_timeout():
	$ScoreTimer.start()

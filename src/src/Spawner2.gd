extends Node2D

const MIN_SPAWN_TIME = 0.8

var preloadedEnemies := [
	preload("res://src/Actors/Enemy.tscn"),
	preload("res://src/Actors/Enemy2.tscn")
]

var enemiesLoc := [
	560, 150
]

onready var spawnTimer := $Spawn_Timer

var nextSpawnTime := 4.0

func _ready():
	randomize()
	
func _on_SpawnTimer_timeout() -> void:
	# Spawn an enemy
	var ind:= randi() % preloadedEnemies.size()
	var enemyPreload = preloadedEnemies[ind]
	var enemy:Enemy = enemyPreload.instance()
	enemy.position = Vector2(position.x, enemiesLoc[ind])
	get_tree().current_scene.add_child(enemy)
	
	# Restart the timer
	nextSpawnTime -= 0.2
	nextSpawnTime = max(nextSpawnTime, MIN_SPAWN_TIME)
	spawnTimer.start(nextSpawnTime)

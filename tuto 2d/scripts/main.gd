extends Node

@export var mobScene: PackedScene
var score

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_gameOver()
	$Music.stop()
	$GameOverSFX.play()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get ready")
	$Music.play()

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_mob_timer_timeout():
	var mob = mobScene.instantiate()
	
	var mobSpawnLocation = get_node("MobPath/MobSpawnLocation")
	mobSpawnLocation.progress_ratio = randf()
	
	var direction = mobSpawnLocation.rotation + PI / 2
	
	mob.position = mobSpawnLocation.position
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	

extends CanvasLayer

signal startGame

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_gameOver():
	show_message("Game Over")
	await $MessageTimer.timeout
	
	$MessageLabel.text = "Dodge the enemies !"
	$MessageLabel.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartBtn.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_btn_pressed():
	$StartBtn.hide()
	startGame.emit()

func _on_message_timer_timeout():
	$MessageLabel.hide()

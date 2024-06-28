extends CanvasLayer

@onready var player: Player = $"../Player"


func _ready() -> void:
	player.die.connect(game_over)
	self.hide()
	get_tree().paused = false


func _on_button_pressed() -> void:
	get_tree().paused = false
	self.hide()
	get_tree().reload_current_scene()
	

func game_over():
	self.show()
	get_tree().paused = true

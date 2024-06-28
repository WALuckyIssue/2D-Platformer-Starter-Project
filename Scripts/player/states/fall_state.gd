extends Node
class_name fall_state

@onready var player = owner

func reset_node() -> void:
	player.animated_sprite.play("fall")

func _physics_process(delta: float) -> void:
	if player.current_state == "fall_state":
		if Input.is_action_pressed("move_left"):
			player.velocity.x = -player.SPEED
		elif Input.is_action_pressed("move_right"):
			player.velocity.x = player.SPEED
		else:
			player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		if player.is_on_floor():
			player.change_state("idle_state")

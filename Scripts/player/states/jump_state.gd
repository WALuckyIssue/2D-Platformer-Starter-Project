extends Node
class_name jump_state

@onready var player = owner

func reset_node() -> void:
	player.animated_sprite.play("jump")
	player.jump_sound.play()

func _physics_process(delta: float) -> void:
	if player.current_state == "jump_state":
		if Input.is_action_pressed("move_left"):
			player.velocity.x = -player.SPEED
		elif Input.is_action_pressed("move_right"):
			player.velocity.x = player.SPEED
		
		if player.velocity.y > 0:
			player.change_state("fall_state")

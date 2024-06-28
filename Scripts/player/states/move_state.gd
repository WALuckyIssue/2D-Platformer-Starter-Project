extends Node
class_name move_state

@onready var player = owner

func reset_node() -> void:
	player.animated_sprite.play("move")

func _physics_process(delta: float) -> void:
	if player.current_state == "move_state":
		if Input.is_action_pressed("move_left"):
			player.velocity.x = -player.SPEED
		elif Input.is_action_pressed("move_right"):
			player.velocity.x = player.SPEED
		else:
			player.change_state("idle_state")
		if Input.is_action_just_pressed("jump") and player.is_on_floor():
			player.velocity.y = player.JUMP_VELOCITY
			player.change_state("jump_state")
			

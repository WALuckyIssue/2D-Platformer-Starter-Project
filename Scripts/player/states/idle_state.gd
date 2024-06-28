extends Node
class_name idle_state

@onready var player = owner

func reset_node() -> void:
	player.animated_sprite.play("idle")

func _physics_process(delta: float) -> void:
	if player.current_state == "idle_state":
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		if Input.is_action_just_pressed("jump") and player.is_on_floor():
			player.velocity.y = player.JUMP_VELOCITY
			player.change_state("jump_state")
		elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
			player.change_state("move_state")

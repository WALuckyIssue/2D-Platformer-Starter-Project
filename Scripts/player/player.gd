extends CharacterBody2D
class_name Player

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var states: Node = $States
@onready var jump_sound: AudioStreamPlayer2D = $jump

signal die

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980

var current_state: String
var direction: int
var health: int = 3

func _ready() -> void:
	change_state("idle_state")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	var direction := Input.get_axis("move_left","move_right")
	_flip_sprite(direction)
	move_and_slide()
	print(health)

func change_state(new_state_name: String) -> void:
	current_state = new_state_name
	for i in states.get_child_count():
		if new_state_name in states.get_child(i).name:
			states.get_child(i).reset_node()
		
func take_damage(damage: int) -> void:
	$hit_sound.play()
	health -= damage
	if health <= 0:
		die.emit()
		
func _flip_sprite(direction):
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false

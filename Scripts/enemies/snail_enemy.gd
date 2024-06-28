extends CharacterBody2D

@onready var front_ray: RayCast2D = $FrontRay
@onready var down_ray: RayCast2D = $DownRay
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_sound: AudioStreamPlayer2D = $hit
@onready var collision_shape: CollisionShape2D = $CollisionShape2D



const SPEED := 50.0
const JUMP_VELOCITY := -400.0
const GRAVITY := 980

var change_dir: bool = true


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		
	if (front_ray.is_colliding()) or (not down_ray.is_colliding()):
		change_dir = not change_dir

	if change_dir:
		animated_sprite.flip_h = false
		velocity.x = -SPEED
		front_ray.set_target_position(Vector2(-20,0))
		down_ray.position = Vector2(-14,0)
	else:
		animated_sprite.flip_h = true
		velocity.x = SPEED
		front_ray.set_target_position(Vector2(20,0))
		down_ray.position = Vector2(14,0)

	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(1)


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		$Hurtbox/CollisionShape2D.position = Vector2(10000,10000)
		$CollisionShape2D.position = Vector2(10000,10000)
		hit_sound.play()
		await hit_sound.finished
		queue_free()

extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collect_sound: AudioStreamPlayer2D = $collect_sound
@onready var collision_shape: CollisionShape2D = $CollisionShape2D



func _on_body_entered(body: Node2D) -> void:
	collision_shape.disabled = true
	collect_sound.play()
	var tween = create_tween()
	tween.tween_property(animated_sprite, "position", Vector2(0,-20), 0.5)
	await tween.finished
	queue_free()
	

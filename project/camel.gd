extends Node2D

@onready var body = $body
@onready var eyeball = $eyeball
@onready var confetti = $Confetti/GPUParticles2D

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_method(tween_it, 0.0, 5.0, 3).set_ease(Tween.EASE_IN_OUT)
	tween.tween_method(set_shader_value, 0.0, 1.0, .5).set_ease(Tween.EASE_OUT)
	tween.tween_callback(explode)


func tween_it(rotations: float):
	var current_direction = rotations * TAU
	eyeball.global_rotation = current_direction


func set_shader_value(value: float):
	body.material.set_shader_parameter("quantity", value)


func explode():
	body.hide()
	confetti.emitting = true
	await get_tree().create_timer(1.5).timeout
	queue_free()
	

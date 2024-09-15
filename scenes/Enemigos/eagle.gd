extends Area2D

@onready var player = $"../Player"
@export var SPEED := 80
@export var damage = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direcction = (player.position  - position).normalized()
	position +=  direcction * delta * SPEED
	if direcction.x > 0:
		$AnimatedSprite2D.flip_h = true
	elif direcction.x < 0:
		$AnimatedSprite2D.flip_h = false	


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		$TimerDamage.start()


func _on_timer_damage_timeout() -> void:
	player.decrease_life(damage)


func _on_body_exited(body: Node2D) -> void:
	$TimerDamage.stop()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

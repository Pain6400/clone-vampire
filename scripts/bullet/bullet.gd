extends Area2D

@export var SPEED = 150 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.rotate(90)
	position.x += SPEED * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_group"):
		area.queue_free()
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

extends Area2D

const SPEED = 200.0
const speed_rotate = 10.0
var direction_player: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if direction_player:
		position += SPEED * delta * direction_player
		rotation += speed_rotate * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

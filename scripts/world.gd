extends Node2D

@export var pig_scene: PackedScene
@export var bullet_scene: PackedScene

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_enemy():
	var enemy = pig_scene.instantiate()
	var player = $Player
	var angle = randf() * PI * 2
	var distance = randf_range(200, 500)
	var offset = Vector2(cos(angle), sin(angle)) * distance
	enemy.position = player.position + offset
	add_child(enemy)

func _on_timer_create_enemy_timeout() -> void:
	create_enemy()

func create_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = position
	add_child(bullet)

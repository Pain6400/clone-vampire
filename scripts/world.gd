extends Node2D

@export var pig_scene: PackedScene
@export var eagle_scene: PackedScene
var player

func _ready() -> void:
	player = $Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_pig():
	var enemy_pig = pig_scene.instantiate()
	
	var angle = randf() * PI * 2
	var distance = randf_range(200, 500)
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var enemy_position = player.position + offset
	
	enemy_pig.position = enemy_position
	add_child(enemy_pig)

func create_eagle():
	var enemy_eagle = eagle_scene.instantiate()
	var angle = randf() * PI * 2
	var distance = randf_range(200, 500)
	var offset = Vector2(cos(angle), sin(angle)) * distance
	var enemy_position = player.position + offset
	
	enemy_eagle.position = enemy_position
	add_child(enemy_eagle)
	
func _on_timer_create_enemy_timeout() -> void:
	#create_pig()
	create_eagle()

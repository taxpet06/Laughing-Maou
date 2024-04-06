extends Area2D

var is_maou = false
var time = 0
var rng = RandomNumberGenerator.new()

func _process(delta):
	if get_parent().enabled:
		get_node("CollisionShape2D").disabled = false

func _ready():
	is_maou = get_parent().is_maou
	time = rng.randi_range(1,60)
	get_parent().get_node("Timer").wait_time = time
	get_parent().get_node("Timer").start()

func _on_input_event(_viewport, event, _shape_idx):
	if !is_maou:
		if (event is InputEventMouseButton && event.pressed):
			get_parent().get_node("AudioStreamPlayer2D").playing = true
			get_parent().get_node("AnimationPlayer").play("leave")
			queue_free()
			await get_tree().create_timer(2).timeout
			get_parent().queue_free()
	else:
		if (event is InputEventMouseButton && event.pressed):
			get_tree().change_scene_to_file("res://lose.tscn")

func _on_timer_timeout():
	get_parent().get_node("AnimationPlayer").play("shake")
	_ready()

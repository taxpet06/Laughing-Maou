extends Node2D
var point_zero = Vector2(0,200)
var point_full = Vector2(720,920)
var margin = 110
var size = 36
var hor
var ver
var step
var maou = preload("res://laughing_maou.tscn")
var rng = RandomNumberGenerator.new()
var true_maou
var i : int = 1
var e : int = 1
var y_value
var factor = 1.25
var enable = false
func _ready():
	hor = (point_full.x-margin) - (point_zero.x + margin)
	ver = (point_full.y-margin) - (point_zero.y + margin)
	step = hor/abs(sqrt(size))
	true_maou = rng.randi_range(1,size)
	y_value = margin
func _process(_delta):
	if enable:
		var children = get_node("AspectRatioContainer/children").get_children()
		for x in children:
			x.enabled = true
	if e < size+1:
		var singular_m = maou.instantiate()
		if e == true_maou:
			singular_m.is_maou = true
		singular_m.position = point_zero + Vector2(i*step*factor,y_value)
		singular_m.scale = Vector2(0.2,0.2)
		get_node("AspectRatioContainer/children").add_child(singular_m)
		i = i + 1
		if i==7 :
			y_value = y_value+margin
			i=1
		e += 1
	else: 
		pass

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		enable = true
		get_node("AnimationPlayer").play("remove")
		get_node("AspectRatioContainer/Area2D/CollisionShape2D").queue_free()
		await get_tree().create_timer(2).timeout
		get_node("AnimationPlayer").queue_free()
		get_node("AspectRatioContainer/Sprite2D3").queue_free()

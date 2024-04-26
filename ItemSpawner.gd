extends Marker2D

@export var item: Resource
@export var maxRange: float
var timer = 0
@export var interval: float
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= interval && is_visible_in_tree():
		spawnItem()
		timer = 0


func spawnItem():
	var item1 = item.instantiate()
	item1.position = Vector2(randi_range(0,maxRange),-150)
	add_child(item1)

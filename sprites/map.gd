extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var image = load("res://sprites/map.png")
	var data = image.get_data()
	data.lock()
	
	var ground = tile_set.find_tile_by_name("Base2")
	
	for i in range(128):
		for j in range(128):
			var pixel = data.get_pixel(i,j)
			if( pixel[0] == 0 ):
				set_cell(i, j, ground)
				#print(pixel)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

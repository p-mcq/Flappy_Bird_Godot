extends Node2D
@onready var top_pipe = $TopPipe
@onready var bottom_pipe = $BottomPipe
@onready var pipe_parent = $"."
@onready var reset_position = $"../ResetPosition"
@onready var gameController: Node2D = %GameController


# Called when the node enters the scene tree for the first time.
func _ready():
	OffsetPipePosition()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move the pipe parent object over to the left each frame
	position.x -= 140 * delta

func OffsetPipePosition():
	#Reset pipes to original position first
	top_pipe.position.y = -120
	bottom_pipe.position.y = 120
	var randomOffset = randf_range(-40, 40)
	top_pipe.position.y += randomOffset
	bottom_pipe.position.y += randomOffset


func _on_reset_pipe_collider_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#print("Pipes Should Reset")
	gameController.IncrementScore()
	position.x = reset_position.position.x
	OffsetPipePosition()
	

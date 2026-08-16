extends Node2D

@onready var leaf_container: HBoxContainer = $LeafContainer
@onready var leaf: TextureRect = $LeafContainer/Leaf1
@onready var leaf_2: TextureRect = $LeafContainer/Leaf2
@onready var leaf_3: TextureRect = $LeafContainer/Leaf3
@onready var leaf_4: TextureRect = $LeafContainer/Leaf4
@onready var leaf_5: TextureRect = $LeafContainer/Leaf5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0) # using the function created
	
	if Global.minigamesDone < 3: # if you havent completed 3 minigames yet 
		Global.minigamesDone = Global.minigamesDone +1
		get_tree().change_scene_to_file("res://scenes/Minigame" + str(Global.minigamesDone) + ".tscn") # changes your scene by arranging this frankenstein path. 
# Above, your script is being told to go to the next minigame. If the 
# current minigame is Level 1, then you would be on minigame 1. If you 
# complete that level, you have the minigames_done add one, and then you 
# look for the scene titled `minigame_` and then whatever minigame number 
# should be next. Make sure you name your minigame saves appropriately.

	else:
		get_tree().change_scene_to_file("res://scenes/TitleScreen.tscn") # changes your scene
	

func _process(delta: float) -> void: # runs EVERY FRAME
	match Global.lives: # asks or checks if lives is equal to one of 
#these values, cool hack. by the way this is a horrid way to illustrate the 
#lives visually so later you can always find alternative code. Now, dw abt it.

		4:
			leaf.hide()
		3:
			leaf.hide()
			leaf_2.hide()
		2:
			leaf.hide()
			leaf_2.hide()
			leaf_3.hide()
		1:
			leaf.hide()
			leaf_2.hide()
			leaf_3.hide()
			leaf_4.hide()
		0:
			leaf_container.hide() # just hides everything
	
	timer.text = str(time) # make ths text reflect the value of the time variable. this makes names easier. the str() converts the int to a String
	level.text = "Level " + str(Global.minigamesDone) # this tells you want minigame you're on using concatenation (google the word yo)

func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	
	time = start_time # make the timer, which is reflected through the timer text, start at your desired number
	
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.1) # asks script to wait on this function. the 'wait' name for the function does nothing here, as await is just telling the scrpit to wait for the function to complete before progressing
		time -= 0.1 # remove 0.1
		# progressively get the value smaller and smaller
	
	#when timer reaches 0
	return

func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait, dw abt this being complex '''

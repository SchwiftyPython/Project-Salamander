extends Node2D

var width = 150
var height = 150
var maxVal = -100
var minVal = 100
var avg 

var Block = preload("blocks.gd")
var tempBlock

var noise_data = {}
var biomeType

func _ready():
	randomize()
	
	# Create basic open-simplex noise
	var noise = OsnNoise.new()
	noise.set_seed(randi()%1000)

	# Get values
	noise.get_noise_2d(width, height)
	
	# Create fractal noise helper
	var fractal_noise = OsnFractalNoise.new()
	fractal_noise.set_source_noise(noise)
	fractal_noise.set_period(64)
	fractal_noise.set_octaves(randi()%8)
	fractal_noise.set_persistance(randf()+ 0.1)
	
	# Get values
	for x in range(width):
		for y in range(height):
			noise_data[Vector2(x, y)] = fractal_noise.get_noise_2d(x, y)
			if (noise_data[Vector2(x, y)] > maxVal):
				maxVal = noise_data[Vector2(x, y)]
			if (noise_data[Vector2(x, y)] < minVal):
				minVal = noise_data[Vector2(x, y)]
	
	avg = abs((maxVal + minVal) / 2)
	biomeType = pick_biome_type(avg)
	
	# debug 
	print(maxVal)
	print(minVal)
	print(avg)
	print(biomeType)
	
	
	# Set Tiles
	# make function for this block of code?
	for x in range(width):
		for y in range(height):
			tempBlock = Block.new()
			if (biomeType == "arctic"):
				if(noise_data[Vector2(x, y)] < avg):
					tempBlock.blockType_set(5) #snowOne
				elif(noise_data[Vector2(x, y)] < maxVal - 0.2):
					tempBlock.blockType_set(6) #snowTwo
				elif(noise_data[Vector2(x, y)] <= maxVal):
					tempBlock.blockType_set(4) #water
			elif (biomeType == "temperate"):
				if(noise_data[Vector2(x, y)] < avg - 0.1):
					tempBlock.blockType_set(0) #grassOne
				elif(noise_data[Vector2(x, y)] < avg + 0.15):
					tempBlock.blockType_set(1) #rock
				elif(noise_data[Vector2(x, y)] < avg + 0.2):
					tempBlock.blockType_set(2) #grassTwo
				elif(noise_data[Vector2(x, y)] < avg + 0.25):
					tempBlock.blockType_set(3) #dirt
				elif(noise_data[Vector2(x, y)] < avg + 0.4):
					tempBlock.blockType_set(randi()%2 + 7) #sandOne or sandTwo
				else:
					tempBlock.blockType_set(4) #water
			elif (biomeType == "arid"):
				if(noise_data[Vector2(x, y)] < avg - 0.1):
					tempBlock.blockType_set(7) #sandOne
				elif(noise_data[Vector2(x, y)] < avg + 0.2):
					tempBlock.blockType_set(8) #sandTwo
				else:
					tempBlock.blockType_set(4) #water
			else:
				print("Invalid biome type!")
			
			print(noise_data[Vector2(x, y)])
			if(tempBlock.blockType_get() != null):
				get_parent().set_cell(x, y, tempBlock.blockType_get()) 


func pick_biome_type(noiseAvg):
	if (noiseAvg <= .025):
		return "arctic"
	elif (noiseAvg <= .06):
		return "temperate"
	else:
		return "arid"
	

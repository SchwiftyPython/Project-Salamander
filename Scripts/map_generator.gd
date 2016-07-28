
extends Node2D

var Block = preload("blocks.gd")
var tempBlock
var blockSprite

var terrainBlocks = preload("res://Tilesets/terrain.res")

var width = 100  # x
var height = 100 # y


func _ready():
	
	for i in range(width):
		for j in range(height):
			tempBlock = Block.new()
			get_parent().set_cell(i, j, tempBlock.blockType_get())




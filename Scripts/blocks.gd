extends Node2D

#temperate values 0 - 4, 7, 8
const grassOne = 0
const rock = 1
const grassTwo = 2
const dirt = 3
const water = 4

#arctic values  4-6
const snowOne = 5
const snowTwo = 6

#arid values 7-8, 4
const sandOne = 7
const sandTwo = 8

var blockType setget blockType_set,blockType_get
 
func _init():
	pass

func blockType_set(type):
	blockType = type

func blockType_get():
	return blockType

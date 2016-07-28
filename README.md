Project Salamander Overview

A prototype of 2D procedural generation using isometric blocks and Open Simplex Noise in Godot game engine. 


Description

This project generates a flat world of 2D isometric blocks procedurally using Open Simplex Noise. I am interested in making a base-building game similar to Gnomoria, but with gameplay elements from the Majesty series. World generation is my first obstacle. 

What I have here is a little code that is capable of producing one of three biome types depending on the average frequency that is calculated after the noise generation. For now, it can make an arid, temperate or arctic map. I modified some isometric blocks I found on opengameart.org to match the biome types and also add some variance to the maps. The blocks are picked based on small frequency ranges allowing for certain blocks to always be near another. For example, sand and dirt on the edge of a body of water.

      
Example

This is my initial success. It’s not much to look at yet, but time and effort will change that.



Future Development

Adding more block types and randomly rotating them to make the terrain look less plain and predictable. 
Implement different elevations to allow for mountains and valleys.
Generate ore, structures, enemies.
Possibly add a few more biome types.
Find a way to generate larger maps without taking forever.

Notes

The biggest problem with this prototype is it is slow. A 100 x 100 world will generate quickly. 250 x 250 takes a minute or two. I’ve tried 500 x 500, but never let it run long enough to finish. 

If you want to run this prototype you’ll need to grab the Open Simplex Noise module for Godot here: https://github.com/Zylann/godot_opensimplex

Then you’ll need to include it when you compile Godot from source: http://docs.godotengine.org/en/latest/reference/_compiling.html

Feel free to modify and improve this anyway you want. Thanks for stopping by!

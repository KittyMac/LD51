#define PAMPHLET_PREPROCESSOR

#include <./figurehead/figurehead.html>
#include <./figurehead/figurehead.js>

#include <./game.js>
#include <./maze.js>
#include <./player.js>
#include <./tile.js>

alert("Hello World")

// The Plan:
// 1. Get the maze displaying on the screen
//  - a maze is a grid of tiles like tsuro
//  - the maze size should be configurable
//  - each tile should be rotatable in 90º
//  - the maze should randomize itself every
//    10 seconds
// 2. Have player be in maze
//  - have player be able to move around

// we need a tile class
// we need a maze class
//   be able to randomize itself
// we need a game class
//   be able to keep score
//   be able to track 10 second timer
//   be able to call randomize on maze
// we need a player class



function testTile() {
    let testTile1 = new Tile(0, 0);
    print(`Tile ID is ${testTile1.id}`);
    print(`Current tile rotation is ${testTile1.rotation}`);
    print(`Tile rotation after rotating is ${testTile1.rotate()}`);
}
function testMaze() {
    let testMaze1 = new Maze(4,8);
    print(`The width of the maze is ${testMaze1.width}`);
    print(`The height of the maze is ${testMaze1.height}`);
    print(`The values for all tiles in the maze are as follows ${testMaze1.allTiles}`);
}

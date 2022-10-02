#define PAMPHLET_PREPROCESSOR
class Maze {
    constructor(width, height) {
        this.width = width;
        this.height = height;
        this.allTiles = [];
        this.totalMazeVal = width * height;
        for ( var i = 0; i < this.totalMazeVal; i++) {
            let newTile = new Tile(0,0);
            this.allTiles.push(newTile);
        }
    }
}

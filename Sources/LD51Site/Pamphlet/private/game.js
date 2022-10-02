#define PAMPHLET_PREPROCESSOR

class Game {
    constructor() {
        this.tick = 0;
        
        this.maze = new Maze(2,2);
        
        for (let tile of this.maze.allTiles) {
            mazeContainer.addChild(tile.sprite);
        }
        for (let x = 0; x < this.maze.width; x++) {
            for (let y = 0; y < this.maze.height; y++) {
                let pixiX = x * 128;
                let pixiY = y * 128;
                print(`${pixiX}, ${pixiY}`);
                let ind = y * this.maze.width + x;
                let tile = this.maze.allTiles[ind];
                tile.sprite.position.set(pixiX, pixiY);
                
            }
        }
            
    }
    
    update() {
        mazeContainer.position.set(app.renderer.width / 2,
                                   app.renderer.height / 2);
    }
}

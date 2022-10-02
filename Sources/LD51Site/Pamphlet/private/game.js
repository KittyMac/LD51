#define PAMPHLET_PREPROCESSOR

class Game {
    constructor() {
        this.tick = 0;
        
        this.maze = new Maze(2,2);
        
        for (let tile of this.maze.allTiles) {
            let sprite = tile.createSprite();
            mazeContainer.addChild(sprite);
        }
    }
    
    update() {
        mazeContainer.position.set(app.renderer.width / 2,
                                   app.renderer.height / 2);
    }
}

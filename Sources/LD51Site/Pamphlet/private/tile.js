#define PAMPHLET_PREPROCESSOR
class Tile {
    constructor (id, rotation) {
        this.id = id;
        this.rotation = rotation;
    }
    rotate() {
        var directionNum = Math.random();
        let pi = Math.PI;
        let halfPi = Math.PI / 2.0;
        if (directionNum > 0.5) {
            this.rotation += halfPi;
        }
        else if (directionNum <= 0.5) {
            this.rotation -= halfPi;
        }
        return this.rotation;
    }
}



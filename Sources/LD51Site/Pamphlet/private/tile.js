#define PAMPHLET_PREPROCESSOR
class Tile {
    constructor (id, rotation) {
        this.id = this.randomizeTileID();
        this.rotation = this.rotate();
        this.sprite = this.createSprite();
    }
    rotate() {
        
        this.rotation = 0;
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
    createSprite() {

        let fileName = this.id.toString().padStart(4, "0");
        let texture = PIXI.Texture.from(`tile${fileName}.png`);
        const sprite = new PIXI.Sprite(texture);
        sprite.anchor.set(0.5, 0.5)
        sprite.rotation = this.rotation;
        return sprite
    }
    randomizeTileID() {
        let randNum = Math.random() * 5;
        this.id = Math.floor(randNum);
        return this.id
}
}


#define PAMPHLET_PREPROCESSOR

function initPixi() {
    // create the application and attach it to the document
    app = new PIXI.Application({
        backgroundColor: 0x000000,
        antialias: true,
        preserveDrawingBuffer: false,
        autoResize: true,
        autoDensity: true,
        resolution: 1
    });
    
    let pixi = document.getElementById("pixi")
    if (pixi != undefined) {
        pixi.appendChild(app.view);
        app.resizeTo = pixi
    } else {
        document.body.appendChild(app.view);
        app.resizeTo = document
    }
    
    // ResizeObserver doesn't exist on mobile safari
    if (typeof ResizeObserver != "undefined") {
        const resizeObserver = new ResizeObserver(entries => {
            app.render()
        });
        resizeObserver.observe(app.view);
    }
    
    // disable pinch to zoom gestures
    document.addEventListener('gesturestart', function(e) {
        e.preventDefault();
        document.body.style.zoom = 1.0;
    });

    document.addEventListener('gesturechange', function(e) {
        e.preventDefault();
        document.body.style.zoom = 1.0;
    });

    document.addEventListener('gestureend', function(e) {
        e.preventDefault();
        document.body.style.zoom = 1.0;
    });

    pixi.addEventListener('wheel', e=>{
        e.preventDefault();
        document.body.style.zoom = 1.0;
    }, {passive: false});
    
    // Fixes memory leak with web audio (audio buffers not forcibly removed will leak)
    window.addEventListener('beforeunload', function (e) {
        PIXI.sound.removeAll();
        delete e['returnValue'];
    });
}

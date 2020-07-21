import p5
var heart: Geometry
proc preload(){.exportc.} =
  heart=loadModel("https://cors-anywhere.herokuapp.com/https://pbkdev.pythonanywhere.com/heart.obj")

proc setup() {.exportc.} =
  createCanvas(200, 200, WEBGL)
  
proc draw() {.exportc.} =
  background(200)
  rotateX(PI)
  rotateY(float(frameCount) * 0.02)
  model(heart)
  fill(168,63,57)

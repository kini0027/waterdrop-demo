import fisica.*;
FWorld world;
FBox box; 
int angle = 0;
float xPos = 0;
float sideMargin = 100;

void setup() {
  size(400, 600); 
  Fisica.init(this);
  world = new FWorld();
box = new FBox(100,100); 
box.setStatic(true);
box.setFill(220);
world.add(box);
}

void draw() {
  background(0);
if (frameCount % 4 == 0) {
    FBlob b = new FBlob();
    float s = random(20, 40);
    float space = (width-sideMargin*2-s);
    xPos = (xPos + random(s, space/2)) % space;
    b.setAsCircle(sideMargin + xPos+s/2, -10, s, 15);
    b.setStroke(255);
    b.setStrokeWeight(2);
    b.setFill(103,162,244);
    b.setFriction(0);
    world.add(b);
}

box.setPosition(mouseX,mouseY);
world.step(); 
world.draw();
}

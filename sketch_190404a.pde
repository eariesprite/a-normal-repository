
float radius = 25;
int direction = 1;
int direction2 = 0;
int food=0; 
float x = 250;
float y = 250;
int numberofFood =50; 
ArrayList<Particle> poop = new ArrayList();
 
void setup() {
  size(1000, 1000);
  ellipseMode(RADIUS);
  for (int i=0; i<numberofFood; i++) { 
    Particle P = new Particle((int)random(height), (int)random(width));
  
      poop.add(P);
  }
}
 
void draw() {
  background(0);
  textAlign(CENTER);
  textSize(40);
  fill(#F0FF2E);
  text("Food " + food, width/2,40);
  fill (#F0FF2E);
  smooth ();
  noStroke();
 rect(0,-14,1000,20);
  rect(-14,0,20,1000);
  rect(995,0,20,1000);
  rect(0, 970, 1000,20);
  render();
  for (int i=0;i<poop.size();i++) {
    Particle Pn = (Particle) poop.get(i);
    Pn.display();
    if (dist(x, y, Pn.x, Pn.y)<radius) { 
      poop.remove(i);
      //radius=radius+0.1; 
      food =food+1; 
    }
    if(food == 0)  {
      text("You're starving!" ,width/2,height/2);
} if(food == 50)  {
      text("You're full!" ,width/2,height/2);
}

}
}
class Particle { 
  int x, y;
  Particle(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void display() {
    noStroke();
    fill(#FFFFFF);
    ellipse(x, y, 5, 5);
  }
}

void keyPressed() {
    if (keyCode == LEFT) {
      x = x - 10;
      direction = -1;
      direction2 = 0;
    }
    else if (keyCode == RIGHT) {  
      x = x + 10;
      direction = 1;
      direction2 = 0;
    }
    else if (keyCode == UP) {
      y = y - 10;
      direction = 0;
      direction2 = -1;
    }
    else if (keyCode == DOWN) { 
      y = y + 10;
      direction = 0;
      direction2 = 1;
    }
  }

 
 
void render() {
  for ( int i=-1; i < 2; i++) {
    for ( int j=-1; j < 2; j++) {
      pushMatrix();
      translate(x + (i * width), y + (j*height));
      if ( direction == -1) { 
        rotate(PI);
      }
      if ( direction2 == 1) { 
        rotate(HALF_PI);
      }
      if ( direction2 == -1) { 
        rotate( PI + HALF_PI );
      }
      arc(0, 0, radius, radius, map((millis() % 500), 0, 500, 0, 0.52), map((millis() % 500), 0, 500, TWO_PI, 5.76) );
      popMatrix();
      
    }
  }
}

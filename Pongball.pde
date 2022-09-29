//Here we create the class for the PongBall in our game
class PongBall {
  float x;
  float y;
  float xspeed, yspeed;
  float diameter;
  float diameter1;
  
  PongBall(float tempX, float tempY, float tempDiameter, float tempDiameter1) {
    int randomIntX = (int)random(1, 3);
    int randomIntY = (int)random(1, 3);
    diameter = tempDiameter;
    diameter1 = tempDiameter1;
    x = tempX;
    y = tempY;
    if (randomIntX == 1) {
      xspeed = -8;
    } else {
      xspeed = 8;
    }
    if (randomIntY == 1) {
      yspeed = -8;
    } else {
      yspeed = 8;
    }
  }

  void display() {
    fill(255,0,0);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(x, y, diameter, diameter1);
  }
  void move() {
    x += xspeed;
    y += yspeed; // Increment y
  }
  
    float left() {
      return x-diameter/2;
    }
    float right() {
      return x+diameter/2;
    }
    float top() {
      return y-diameter/2;
    }
    float bottom() {
      return y+diameter/2;
    }
}

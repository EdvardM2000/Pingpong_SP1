//The board of the game
PlayerShield PlayerShieldLeftSide;
PlayerShield PlayerShieldRightSide;
PongBall PongBall1;
boolean[] keys;
int PlayerScore1 = 0;
int PlayerScore2 = 0;

void setup() {
  size(750, 450);
  textSize(60);
  textAlign(CENTER);
  PlayerShieldLeftSide = new PlayerShield(15, height/2, 50, 100);
  PlayerShieldRightSide = new PlayerShield(width-15, height/2, 50, 100);
  PongBall1 = new PongBall(375, 225, 20, 20);
  keys=new boolean[4];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
}

void draw() {
  background(0);
  PongBall1.display();
  PongBall1.move();
  text(PlayerScore1, width/2-50, 60);
  text(PlayerScore2, width/2+50, 60);
  PlayerShieldLeftSide.move();
  PlayerShieldLeftSide.display();
  PlayerShieldRightSide.move();
  PlayerShieldRightSide.display();
  fill(255,0, 00);
  rect(00, 00, 20, 750);
  rect(730, 00, 750, 750);

  if (PongBall1.x > width || PongBall1.x < 0) {
    Goal1();    
    Goal();
  }
  // Check vertical edges
  if (PongBall1.y > height || PongBall1.y < 0) {
    PongBall1.yspeed *= -1;
  }

  if ( keys[0]) 
  {  
    PlayerShieldLeftSide.speedY = -7;
  }
  if ( keys[1]) 
  {
    PlayerShieldLeftSide.speedY= +7;
  }
  if ( keys[2])
  {
    PlayerShieldRightSide.speedY= -7;
  }
  if ( keys[3])
  {
    PlayerShieldRightSide.speedY = +7;
  }
  
  if ( PongBall1.left() < PlayerShieldLeftSide.right() && PongBall1.y > PlayerShieldLeftSide.top() && PongBall1.y < PlayerShieldLeftSide.bottom()){
 PongBall1.xspeed = -PongBall1.xspeed;
 }
 
 if ( PongBall1.right() > PlayerShieldRightSide.left() && PongBall1.y > PlayerShieldRightSide.top() && PongBall1.y < PlayerShieldRightSide.bottom()) {
 PongBall1.xspeed = -PongBall1.xspeed;
 }
  
}

void keyPressed()
{
  if (key=='w')
    keys[0]=true;
  if (key=='s')
    keys[1]=true;
  if (keyCode==UP)
    keys[2]=true;
  if (keyCode==DOWN)
    keys[3]=true;
}

void keyReleased()
{
  if (key=='w')
    PlayerShieldLeftSide.speedY = 0;
  keys[0]=false;
  if (key=='s')
    PlayerShieldLeftSide.speedY = 0;
  keys[1]=false;
  if (keyCode==UP)
   PlayerShieldRightSide.speedY = 0;
  keys[2]=false;
  if (keyCode==DOWN)
    PlayerShieldRightSide.speedY = 0;
  keys[3]=false;
}

void Goal() {
  PongBall1 = new PongBall(375, 225, 20, 20);
  PongBall1.display();
  PongBall1.move();
}
//The score counter
void Goal1() {
  PongBall1.x += PongBall1.xspeed;
  PongBall1.y += PongBall1.yspeed;
  if (PongBall1.x > width) {
    PlayerScore1 = PlayerScore1 + 1;
  }
  if (PongBall1.x < 0) {
    PlayerScore2 = PlayerScore2 + 1;
  }
}

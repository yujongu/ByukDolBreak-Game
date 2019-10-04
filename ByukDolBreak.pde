float xPos;
Ball ball;
Block block;
GenBlocks blocks;
void setup() {
  size(400, 400);
  rectMode(CENTER);
  ball = new Ball(width / 2, height - 40);
  blocks = new GenBlocks();
  block = new Block();
  xPos = width/2;
}

void draw() {
  background(0);
  stroke(255);

  //xPos = mouseX; //controlls the box with the mouse

  blocks.placeBlocks();
  ball.action();
  blocks.checkHit();

  rect(xPos, height - 30, 50, 5);
  if (ball.bPosY > height - 20) {
    GameOver gameover = new GameOver();
  }
  if (ball.bPosY > height - 5) {
    delay(5000);
    exit();
  }
}

void keyPressed() {
  //controls the box with the direction button
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (xPos > 25) {
        xPos -= 10;
      }
    } else if (keyCode == RIGHT) {
      if (xPos < width - 25) {
        xPos += 10;
      }
    }
  }

  if (keyCode == ' ') {
    if (ball.speed == 0) {
      ball.shoot();
    }
  }
}

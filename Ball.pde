class Ball {
  float speed = 0;
  float direction = 0;
  float bPosX;
  float bPosY;
  float radius = 10;
  Ball(float x, float y) {
    this.bPosX = x;
    this.bPosY = y;
    this.speed = 0;
  }

  void action() {
    //left and right ball follow
    if (speed == 0 && xPos - 25 > bPosX) {
      bPosX += 10;
    } else if (speed == 0 && xPos + 25 < bPosX) {
      bPosX -= 10;
    }

    if (bPosX < 6 || bPosX > width - 6) { //bounce from left or right wall
      direction = 180 - direction;
    }
    if (bPosY < 6) { //bounce from ceil
      direction = 360 - direction;
    }

    if (speed != 0 && bPosY > height - 41 && bPosX > xPos - 25 && bPosX < xPos + 25) {
      shoot();
    }

    //if (bPosY > height - 30) {
    //  println("GAME OVER");
    //  delay(5000);
    //  exit();
    //}

    bPosX += speed * Math.cos(radians(direction));
    bPosY -= speed * Math.sin(radians(direction));
    ellipse(bPosX, bPosY, radius, radius);
    if (direction > 360) {
      direction -= 360;
    }
  }

  
  void shoot() {
    speed = 5;

    if (bPosX <= xPos - 15) { //far left
      direction = 150;
    } else if (bPosX > xPos - 15 && bPosX <= xPos - 5) { //left
      direction = 120;
    } else if (bPosX > xPos - 5 && bPosX <= xPos + 5) { //middle
      direction = 90;
    } else if (bPosX > xPos + 5 && bPosX <= xPos + 15) { //right
      direction = 60;
    } else if (bPosX >= xPos + 15) { //far right
      direction = 30;
    }
  }
}

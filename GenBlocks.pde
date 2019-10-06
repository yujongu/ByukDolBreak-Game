class GenBlocks {
  Block block = new Block();
  Block[][] blockPos = new Block[(int) (width/block.blockWidth)][5];

  GenBlocks() {
    for (int i = 0; i < width/block.blockWidth; i++) {
      for (int j = 0; j < 5; j++) {
        blockPos[i][j] = new Block(i, j);
      }
    }
  }

  void placeBlocks() {
    push();
    translate(0, 30);
    for (int i = 0; i < width/block.blockWidth; i++) {
      for (int j = 0; j < 5; j++) {
        if (blockPos[i][j].broken == false) {
          stroke(0);
          rectMode(CORNER);
          rect(blockPos[i][j].xPos, blockPos[i][j].yPos, block.blockWidth, block.blockHeight);
        }
      }
    }
    pop();
  }

  void checkHit() {
    for (int i = 0; i < width/block.blockWidth; i++) {
      for (int j = 0; j < 5; j++) {
        if (blockPos[i][j].broken == false && 
          circleRect(ball.bPosX, ball.bPosY, ball.radius, blockPos[i][j].xPos, blockPos[i][j].yPos, block.blockWidth, block.blockHeight)) {
          blockPos[i][j].broken = true;
          
          ball.direction = 360 - ball.direction;
          return;
        }
      }
    }
  }


  // CIRCLE/RECTANGLE code by Matt Worden
  // http://jeffreythompson.org/collision-detection/circle-rect.php
  boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }
}

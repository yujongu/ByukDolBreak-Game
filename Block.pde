class Block {
  float xPos;
  float yPos;
  boolean broken;
  float blockWidth = 40;
  float blockHeight = 10;

  Block(){
    
  }
  
  Block(float X, float Y) {
    this.xPos = X * blockWidth;
    this.yPos = Y * blockHeight;
    broken = false;
  }

  
}

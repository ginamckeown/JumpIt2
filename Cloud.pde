class Cloud {
  float x, y, w, h, s;

  Cloud(float tempX, float tempY, float tempW, float tempH, float tempS) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    s = tempS;
  }

  void display() {
    fill(255, 150);
    ellipse(x, y, w, h);
  }

  void move() {
    x -= s;
    if (x > width + w/2) {      
      x = 0 - w/2;
    }
  }
}

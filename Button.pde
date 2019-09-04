class Button {
  float x;
  float y;
  float w;
  float h;
  int curve;
  color c;
  boolean pressed;

  Button(float tempx, float tempy, float tempw, float temph, int tempcurve, color tempc) {
    x = tempx;
    y = tempy;
    w = tempw;
    h = temph;
    curve = tempcurve;
    c = tempc;
    pressed = false;
  }

  void display() {
    noStroke();
    if (!pressed()) {
      // shadow
      fill(0, 40);
      rectMode(CENTER);
      rect(x - 4, y + 4, w, h, curve);
    }

    // button
    fill(c);
    rectMode(CENTER);
    rect(x, y, w, h, curve);
  }

  void hover() {
    if (mouseX >= x - w/2 && mouseX <= x + w/2 
      && mouseY >= y - h/2 && mouseY <= y + h/2) {
      fill(0, 50);
      rect(x, y, w, h, curve);
    }
  }

  boolean pressed() {
    if (mouseX >= x - w/2 && mouseX <= x + w/2 
      && mouseY >= y - h/2 && mouseY <= y + h/2 && mousePressed) {
      return true;
    }
    return false;
  }
}

class Player {
  String name;
  float speed;
  float x, y, d;
  color c;

  Player(String tempName, color tempC) {
    name = tempName;
    // if player has not entered name, it will be automatic
    if (name == " ") {
      name = "unkown";
    }
    x = width/3;
    y = height/3*2;
    d = 60;
    speed = 2;
    c = color(tempC);
  }

  void display() {
    fill(c);
    ellipse(x, y, d, d);
  }

  void move() {
    // add something relating to platform
    x = x + speed;
  }

  void score() {
  }
}

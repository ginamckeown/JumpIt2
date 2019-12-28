class Platform {
  int version; // will stand for the different platform versions
  float x, y, w, h;
  float s; // speed

  Platform() {
    // platform versions are decided at random, each new platform will be a random type
    //version = int (random(1, 4));
    version = 1;
    x = 0;
    y = random(100, 500);
    w = random(20, 200);
    h = random(20, 50);
    s = 1;
  }

  void display() {
    // platform with triangluar stands
    if (version == 1) {
      rect(x, y, w, h);
      for (float i = x/10; i < x; i += i) {
        stroke(20);
        line(x, y - h, x + i, 0);
        line(x + i, 0, y - h, x + i + i);
      }
    }
    fill(0);

    // floating platform with obstacle
    if (version == 2) {
      rect(x, y, w, h);
    }

    //
    if (version == 3) {
      rect(x, y, w, h);
    }
  }

  void move() {
    x = x - s;
  }
}

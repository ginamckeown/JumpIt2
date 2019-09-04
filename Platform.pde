class Platform {
  int version; // will stand for the different platform versions
  float x, y, w, h;
  float s; // speed

  Platform() {
    // platform versions are decided at random, each new platform will be a random type
    version = int (random(1, 4));
    x = width;
    y = random(100, 500);
    w = random(20, 200);
  }

  void display() {
    // platform with triangluar stands
    if (version == 1) {
      rect(x, y, w, h);
    }

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

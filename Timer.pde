class Timer {
  int time;
  int timePast;

  Timer() {
  }

  void display() {
    timePast = second();
    time = second() - timePast;
    fill(189, 138, 186);
    text(time, 540, 40);
  }
}

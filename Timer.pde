class Timer {
  int seconds, minutes;
  int currentTime;

  Timer() {
    seconds = 0;
    minutes = 0;
    currentTime = millis();
  }

  void display() {
    fill(156, 106, 153);
    textSize(30);
    textAlign(CENTER);
    text(getMinutes() + ":" + getSeconds(), width/12*11, height/15);
  }
  
  int getSeconds() {
    seconds = millis()/1000 - getMinutes() * 60;
    return seconds;
  }

  int getMinutes() {
    minutes = millis()/(1000 * 60);
    return minutes;
  }
}

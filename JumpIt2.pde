// Images
PImage trophyIcon;
PImage homeIcon;

// Buttons
Button start, homeScreen, leaderBoard, enter, textbox, green, blue, orange;
boolean gameOpen, homeScreenOpen, leaderBoardOpen, enterPressed, textboxPressed;

// Text
float textX, textY;

// Variable to store text currently being typed and saved text
String nameTyping = "";
String nameSaved = "";
float nameWidth;

// Game
Cloud[] clouds;
Timer timer;

// Highscore
int highScore1, highScore2, highScore3, highScore4, highScore5;

//Player
Player player;
color playerColor;

//Platform
Platform[] platform;

// Colors
color homeScreenC = color(65, 138, 138);
color leaderBoardC = color(207, 161, 64);

void setup() {
  size(600, 600);
  // Image 
  trophyIcon = loadImage("trophyIcon.png");
  homeIcon = loadImage("homeIcon.png");

  // Create buttons
  start = new Button(width/2, 500, 300, 80, 20, color(35, 174, 169));
  enter = new Button(width/2, height/2, 85, 40, 10, color(35, 174, 169));
  textbox = new Button(width/2, height/8*3, 250, 50, 20, color(255));
  homeScreen = new Button(width/12, width/10, 60, 60, 10, homeScreenC);
  leaderBoard = new Button(width/12, width/4, 60, 60, 10, leaderBoardC);
  green = new Button(width/2 - 50, width/3*2, 40, 40, 10, color(54, 168, 98));
  blue = new Button(width/2, width/3*2, 40, 40, 10, color(54, 151, 168));
  orange = new Button(width/2 + 50, width/3*2, 40, 40, 10, color(204, 144, 24));

  // Create platforms
  platform = new Platform[3];
  platform[0] = new Platform();
  platform[1] = new Platform();
  platform[2] = new Platform();

  // Create timer
  timer = new Timer();

  // Create clouds
  clouds = new Cloud[8];
  clouds[0] = new Cloud(70, 100, 70, 70, .2);
  clouds[1] = new Cloud(120, 80, 100, 100, .2);
  clouds[2] = new Cloud(160, 90, 60, 60, .2);
  clouds[3] = new Cloud(280, 180, 80, 80, .2);
  clouds[4] = new Cloud(330, 160, 100, 100, .2);
  clouds[5] = new Cloud(390, 180, 80, 80, .2);
  clouds[6] = new Cloud(510, 110, 90, 90, .2);
  clouds[7] = new Cloud(550, 120, 70, 70, .2);

  // Create player
  player = new Player();
}

void draw() {
  // The homeScreen is the first open tab, automatically opened when game starts
  homeScreenOpen = true;

  // Main functions
  displayHomeScreen();
  displayLeaderBoard();
  displayGame();
  displayMenu();
}

void mousePressed() {
  // Main Menu Tabs
  // checks if the menu buttons have been pressed
  if (leaderBoard.pressed()) {
    leaderBoardOpen = true;
    // Others tabs are no longer open
    gameOpen = false;
    homeScreenOpen = false;
  }
  if (homeScreen.pressed()) {
    homeScreenOpen = true;
    // Others tabs are no longer open
    leaderBoardOpen = false;
    gameOpen = false;
  }

  if (homeScreenOpen) { // if on homescreen, these buttons are avalible
    // Start Button
    if (start.pressed()) {
      gameOpen = true;
      // Others tabs are no longer open
      leaderBoardOpen = false;
      homeScreenOpen = false;
    } 

    // Extra Buttons
    if (enter.pressed()) {
      enterPressed = true;
    } else {
      enterPressed = false;
    }
    if (textbox.pressed()) {
      textboxPressed = true;
    } else {
      textboxPressed = false;
    }
  } else { // buttons are unactivated if not on the homescreen
    textboxPressed = false;
    enterPressed = false;
    gameOpen = false;
  }

  // Set color based on buttons pressed
  if (green.pressed()) {
    player.changeColorTo(green.c);
  } else if (blue.pressed()) {
    player.changeColorTo(blue.c);
  } else if (orange.pressed()) {
    player.changeColorTo(orange.c);
  } 
  //  else {
  //    // If no color chosen, random color will be used
  //    playerColor = color(random(0, 256), random(0, 256), random(0, 256));
  //  }
}

void keyPressed() {
  // Text input feature
  if (textboxPressed) {
    if (key == 8 && nameTyping.length() > 0) {
      // If delete key is pressed the string becomes 1 character smaller
      nameTyping = nameTyping.substring (0, nameTyping.length()-1);
    } else {
      nameWidth = textWidth(nameTyping);
      if (nameWidth < textbox.w - 40) { // type within textbox only
        // Each character typed by the user is added to the end of the string variable
        nameTyping = nameTyping + key;
      }
    }
  }

  //check for touching
  //something like: 
  //for (i = 0;  i < platforms.length; i++){
  //   check each platform by: player.isTouching(platforms[i]);
  //}
}

void displayHomeScreen() {
  if (homeScreenOpen) {
    textAlign(CENTER); // center text
    background(159, 201, 199);
    //Game Name
    textSize(110);
    fill(homeScreenC, 50); // shadow
    text("Jump It", width/2 - 5, height/4 + 5);
    fill(homeScreenC);
    text("Jump It", width/2, height/4);

    // Start Button
    noStroke();
    start.display();
    start.hover();
    fill(255);
    textSize(60);
    text("START", width/2, start.y + start.h/4);
    fill(0);
    fill(150);
    rect(286, start.y + 70, 75, 30, 10);
    fill(10, 69, 69);
    textSize(23);
    text("Press SPACE to Jump", width/2, start.y + start.h);

    // Enter Button
    enter.display();
    enter.hover();
    fill(255);
    textSize(20);
    text("ENTER", width/2, enter.y + 5);

    textAlign(BASELINE);
    // Text Box for Name
    fill(255);
    textbox.display();
    textbox.hover();

    // If the enter button on screen or the enter key is pressed, the name will save
    if (enterPressed || key == '\n') {
      nameSaved = nameTyping;
    }

    // Display typed text
    textX = textbox.x - textbox.w/2 + 20;
    textY = textbox.y + textbox.h/2 - 15;
    fill(0);
    textSize(25);
    text(nameTyping, textX, textY); // input

    // Change to new name
    player.changeNameTo(nameSaved);

    // Display text cursor
    nameWidth = textWidth(nameTyping);
    if (textboxPressed) {
      if (frameCount % 80 >= 0 && frameCount % 80 <= 25) {
        strokeWeight(1);
        stroke(0);
        line(nameWidth + textX, textY + 5, nameWidth + textX, textY - 28);
      }
    }

    // If text is too long, user can no longe type
    textAlign(CENTER);
    if (nameWidth >= textbox.w - 40) {
      fill(230, 41, 28);
      textSize(15);
      text("Your text is too long", width/2, textbox.y + 45);
    }

    // Display player color options
    green.display();
    green.hover();
    blue.display();
    blue.hover();
    orange.display();
    orange.hover();
    textSize(25);
    fill(10, 69, 69);
    text("Select Color:", width/2, blue.y - 30);
  }
}

void displayLeaderBoard() {
  if (leaderBoardOpen) {
    background(240, 206, 134);

    // Title
    textSize(60);
    fill(0, 40); // shadow
    text("Leader Board", width/2, height/7 + 4 ); 
    fill(196, 151, 27);
    text("Leader Board", width/2, height/7);

    // Create leaderBoard
    int boardX, boardY, boardW, boardH;
    boardX = width/6;
    boardY = width/5;
    boardW = width - width/5;
    boardH = height - width/4;

    rectMode(CORNER);
    fill(0, 30); // shadow
    rect(boardX - 10, boardY + 10, boardW, boardH, 20);
    fill(227, 171, 2);
    rect(boardX, boardY, boardW, boardH, 20);
    for (int i = boardH/5 + boardY; i < boardH; i += 180) {
      fill(237, 201, 90);
      rect(boardX, i, boardW, boardH/5);
    }

    // List of Top Players
  }
}

void displayGame() {
  if (gameOpen) {
    // Game Background
    background(230, 209, 229);
    fill(138, 10, 133);
    triangle(-500, height, 900, height, 900, 0);
    fill(176, 91, 172);
    triangle(-900, 0, 0, height, 900, height);
    fill(189, 138, 186);
    triangle(0, height, width, height, width, 400);

    // Timer
    timer.display();
    
    // Player Name
    player.displayName();

    // Create Clouds
    for (int i = 0; i < clouds.length; i++) {
      clouds[i].display();
      clouds[i].move();
    }

    // display player
    player.display();

    // display platforms
    for(int i = 0; i > platform.length; i++) {
      platform[i].display();
      platform[i].move();
    }
  }
}

void displayMenu() {
  // Create homeScreen button
  noStroke();
  homeScreen.display();
  homeScreen.hover();
  strokeWeight(4);
  stroke(0);
  image(homeIcon, homeScreen.x - homeScreen.w/12*5, homeScreen.y - homeScreen.w/12*5);

  // Create leaderBoard button
  noStroke();
  leaderBoard.display();
  leaderBoard.hover();
  image(trophyIcon, leaderBoard.x - leaderBoard.w/2, leaderBoard.y - leaderBoard.h/2);
}

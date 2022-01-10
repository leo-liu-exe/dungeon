
void intro () {
  //Introscreen
  size(800, 800);
  //Intro Text

  e = int(random(0, 6));
  c = int(random(0, 6));
  ourGIF.show();
  myGIF.show();
  yourGIF.show();

  blueButton = new Button("start ", 400, 600, 250, 150, blue, pink);
  blueButton.show();
  //modulus mod


  if (blueButton.clicked) {
    mode = game;
  }
}

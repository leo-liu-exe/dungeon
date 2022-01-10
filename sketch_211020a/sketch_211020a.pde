//framework
int mode;
final int intro = 1;
final int gameover = 2;
final int game = 3;
final int pause = 4;
PImage map;
PImage shotgun;
PImage sniper;
PImage heart;
PImage pistol;
boolean w, s, a, d, spacekey, one, two, three, four;
boolean mouseReleased;
boolean hadPressed;

AnimatedGIF myGIF;
AnimatedGIF yourGIF;
AnimatedGIF ourGIF;


Button blueButton, greenButton, pinkButton, blackButton;
color bkg;
int y;
color blue   = #00ffee;
color green  = #CEF255;
color pink   = #ff00c5;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;
color purple = #FA00F6;
color lbrown = #B27907;
color brown = #795306;
color red = #FF190D;

color northroom, eastroom, southroom, westroom;

ArrayList<GameObject> myobj;
ArrayList<darknesscell> darkness;

final int AMMO = 1;
final int GUN = 2;
final int  HEALTH = 3;

hero    myhero;


//intro
PImage[] gif;
int f = 8;
int numberOfFrames;

//array
String[] words;
color [] colors;
int e = int(random(0, 6));
int c = int(random(0, 6));
int cf = int(random(2, 4));




void setup() {
  size(800, 800);
  map = loadImage("map.png");
  myobj = new ArrayList<GameObject> (1000);
  myhero = new hero();
  myobj.add(myhero);


  darkness = new ArrayList<darknesscell>();
  float s = 10;
  int x = 0, y = 0;
  while ( y< height+s) {
    darkness.add (new darknesscell(x, y, s));
    if (x >= width) {
      x=0;
      y += s;
    } else {
      x += s;
    }
  }

  shotgun = loadImage("shotgun.png");
  shotgun.resize(50, 25);
  sniper = loadImage("sniper.png");
  sniper.resize(50, 25);
  pistol = loadImage("pistol.png");
  pistol.resize(50,25);
  heart = loadImage("kek.png");
  heart.resize(25, 25);

  mode = intro;

  x= 0;
  y=0;
  while (y<map.height) {
    color  roomcolor = map.get(x, y);
    if (roomcolor == pink) {
      myobj.add(new follow(x, y));
      //myobj.add(new follow(x, y));
    }
    if (roomcolor == blue) {
      myobj.add(new enemy(x, y));
    }
    x++;
    if (x==map.width) {
      x = 0;
      y++;
    }
  }

  textAlign ( CENTER, CENTER );
  myGIF = new AnimatedGIF(38, "frame_", "_delay-0.03s.png", 100, 100, 200, 200);
  yourGIF = new AnimatedGIF(38, "frame_", "_delay-0.03s.png", 500, 500, 300, 300);
  ourGIF = new AnimatedGIF(3, "gameGif/frame_", "_delay-0.2s.png");
}
void draw () {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else if (mode== pause) {
  }
  if (mousePressed) hadPressed = true;
  if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  }
}
void keyPressed() {
  //keyboard input setup
  if (key == 'w')    w = true;
  if (key == 's')    s = true;
  if (key == 'a')    a = true;
  if (key == 'd')    d = true;
  if (key == ' ')    spacekey = true;

  if (key == '1')    one = true;
  if (key == '2')    two = true;
  if (key == '3')    three = true;
  if (key == '4')    four = true;
}

void keyReleased() {
  //keyboard input setup
  if (key == 'w')   w = false;
  if (key == 's')   s = false;
  if (key == 'a')   a = false;
  if (key == 'd')   d = false;
  if (key == ' ')   spacekey = false;

  if (key == '1')   one = false;
  if (key == '2')   two = false;
  if (key == '3')   three = false;
  if (key == '4')    four = false;
}

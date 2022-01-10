class DroppedItem extends GameObject {
  int type;
  int n;
  weapon w;

  DroppedItem(float x, float y, int rx, int ry, int drop) {
    type = drop;
    if (type == GUN) {
      n = int(random(0, 3));
      if (n == 0) {
        w = new shotgun();
      } else if (n == 1) {
        w = new sniper();
      } else if (n == 2) {
        w = new pistol();
      }
    }
    hp = 1;
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = white;
  }

  void show() {
    if (type == GUN) {
      if (n == 0) {
        image(shotgun, loc.x, loc.y);
      } else if (n == 1) {
        image(sniper, loc.x, loc.y);
      } else if (n == 2) {
        image(pistol, loc.x, loc.y);
      }
    } else if (type == HEALTH) {
      image(heart, loc.x, loc.y);
    }
  }
}


















//class DropItem extends GameObject {

//  int type;
//  int guns;
//  weapon w;

//  DropItem(float x, float y, int rx, int ry, int drop) {
//    w = new shotgun();
//    w = new sniper();

//    type = (int)random(2);
//    if (type == 1) type = HEALTH;
//    if (type == 2) type = GUN;
//    {
//      guns = (int)random(2);
//      if (guns == 0) w = new shotgun();
//      if (guns == 1) w = new sniper();
//    }
//    loc= new PVector(x, y);
//    vel = new PVector(0, 0);
//    f = 20;
//    roomX= rx;
//    roomY= ry;
//  }

//  void show() {
//    if (type == HEALTH) {

//      image(heart, loc.x, loc.y);
//    }
//    if (type == GUN) {
//      if (guns == 0) {
//        image(shotgun, loc.x, loc.y);
//      }
//      if (guns == 1) {
//        image(sniper, loc.x, loc.y);
//      }
//    }
//  }
//  void act() {
//  }
//}

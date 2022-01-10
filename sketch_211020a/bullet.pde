class Bullet extends GameObject {

  float speed;
  int s;
  int damage;
  color colour;
  Bullet(PVector aimVector) {
    loc = myhero.loc.copy();
    vel = aimVector.copy();
    speed = 10;
    vel.setMag(speed);
    hp = 1;
    s = 5;
    colour = pink;
  }

  Bullet(PVector mouseaim, color ncolor, int nsize, float nspeed) {
    loc = new PVector(myhero.loc.x, myhero.loc.y);
    vel = mouseaim;
    speed = nspeed;
    vel.setMag(speed);
    hp = 1;
    s = nsize;
    colour = ncolor;
    roomX = myhero.roomX;
    roomY = myhero.roomY;
  }

  void show() {
    stroke(colour);
    fill(colour);
    ellipse(loc.x, loc.y, s, s);
  }

  void act() { 
    loc.add(vel);
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) {
      hp = 0;
    }
  }
}

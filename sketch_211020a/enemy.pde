class enemy extends GameObject {

  enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    size= 50;
    roomX = 1;
    roomY = 1;
    xp =1;
  }
  enemy(int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    size= 50;
    roomX = x;
    roomY = y;
    xp =1;
  }
  enemy(int _hp, int s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = _hp;
    size= s;
    roomX = x;
    roomY = y;
  }

  void show() {
    if (roomX == myhero.roomX && roomY == myhero.roomY) {
      stroke(black);
      strokeWeight(2);
      fill(green);
      circle(loc.x, loc.y, size);
      fill(black);
      textSize(20);
      text(hp, loc.x, loc.y);
    }
  }
  void act() {
    super.act();
    int i=0;
    while (i<myobj.size()) {
      GameObject obj = myobj.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - int(obj.vel.mag()) ;
          obj.hp=0;
          if (hp<=0) {
            explode(f, 100, red);
            myobj.add(new Message("+"+xp, loc.x, loc.y, roomX, roomY));
            myhero.xp =myhero.xp + xp;
            int chance = int(random(0, 100));
            if (chance < 100) {
              int dropChance = int(random(1, 3));
              if (dropChance == 1) {
                drop = GUN;
              } else if (dropChance == 2) {
                drop = HEALTH;
              }
              myobj.add(new DroppedItem(loc.x, loc.y, roomX, roomY, drop));
            }
          }

          //if (myhero.weaponWheel == 1) {
          //  hp - = pistol.;
          //}

          //if (myhero.weaponWheel == 3) {
          //  hp -= sniper.damage;
          //}
          //if (myhero.weaponWheel == 4) {
          //  hp -= shotgun.damage;
          //}
        }
      }
      i++;
    }
  }
}

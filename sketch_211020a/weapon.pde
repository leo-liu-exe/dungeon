class weapon {
  int shottimer;
  int threshold;
  int bulletspeed;
  int bulletc = 10;
  int damage;
  int inaccuracy;
  weapon() {
    shottimer = 0;
    threshold = 30;
    bulletspeed = 5;
  }


  weapon (int thr, int ps, int count, int dmg, int inc) {
    shottimer = 0;
    threshold = thr;
    bulletspeed = ps;
    bulletc = count;

    damage = dmg;
    inaccuracy=inc;
  }

  void update() {
    shottimer++;
  }





  void shoot() {
    //if (shottimer >= threshold){
    //  PVector aimVector = new PVector (mouseX-myhero.loc.x,mouseY-myhero.loc.y);
    //  aimVector.setMag(bulletspeed);
    //  myobj.add(new Bullet(aimVector,blue,10,10));
    //  shottimer=0;

    //}
    if (shottimer >= threshold) {
      int i=0;
      while (i<bulletc) {
        PVector aimVector = new PVector((mouseX+random(-inaccuracy, inaccuracy))-myhero.loc.x, (mouseY+random(-inaccuracy, inaccuracy))-myhero.loc.y);
        myobj.add(new Bullet(aimVector, blue, 10, bulletspeed+random(0, 10)));
        i++;
      }
      shottimer = 0;
    }
  }
}

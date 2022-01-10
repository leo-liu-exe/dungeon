class sniper extends weapon {
  sniper() {
    super (60, 30, 1, 12, 0);
  }
}
class pistol extends weapon {
  pistol() {
      super(10, 13, 1, 2, 0);
  }
}

class shotgun extends weapon {
  shotgun() {
    super (45, 18, 10, 2, 40);
  }
  void shoot() {
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

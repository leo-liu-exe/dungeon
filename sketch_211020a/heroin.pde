class hero extends GameObject {

  float speed;
  int weaponWheel;
  weapon myweapon;

  weapon pistol, sniper, shotgun;
  hero() {
    super();
    weaponWheel=1;
    
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    speed = 5;
    roomX=1;
    roomY=1;
    size = 40;
    myweapon = new pistol();
    //pistol = new weapon(10, 13, 1, 2, 0);
    //sniper= new weapon(60, 30, 1, 12, 0);
    //shotgun= new weapon(45, 18, 10, 2, 40);
  }

  void show() {
    fill(purple);
    stroke(black);
    strokeWeight(2);
    circle(loc.x, loc.y, size);
    println(roomX, roomY);
  }

  void act() {
    super.act();


    if (w) vel.y = -speed;
    if (a) vel.x = -speed;
    if (s) vel.y = speed;
    if (d) vel.x = speed;


    if (vel.mag()>speed) vel.setMag(speed);


    if (w && s) vel.y =0;
    if (a && d) vel.x =0;


    if (!w && !s) vel.y=vel.y * 0.91;
    if (!a && !d) vel.x =vel.x * 0.91;

    if (northroom !=#FFFFFF && loc.y == height*0.1 && loc.x >=width/2-50 && loc.x<=width/2+50) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10  );
    }
    if (eastroom !=#FFFFFF && loc.x == width*0.9 && loc.y >=height/2-50 && loc.y<=height/2+50) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2 );
    }
    if (westroom !=#FFFFFF && loc.x == width*0.1 && loc.y >=height/2-50 && loc.y<=height/2+50) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2 );
    }
    if (southroom !=#FFFFFF && loc.y == height*0.9 && loc.x >=width/2-50 && loc.x<=width/2+50) {
      roomY++;
      loc = new PVector(width/2, height*0.1+10  );
    }
  
  if (one) {
    weaponWheel = 1;
  }
  if (two) {
    weaponWheel = 2;
  }
  if (three) {
    weaponWheel = 3;
  }
  if (four) {
    weaponWheel = 4;
  }
 myweapon.update();
 if (spacekey) myweapon.shoot();

  //if (weaponWheel == 1) {
  //  pistol.update();
  //  if (spacekey) {
  //    pistol.shoot();
  //  }
  //}


  //if (weaponWheel == 2) {
  //  sniper.update();
  //  if (spacekey) {
  //    sniper.shoot();
  //  }
  //}
  //if (weaponWheel == 3) {
  //  shotgun.update();
  //  if (spacekey) {
  //    shotgun.shoot();
  //  }
  //}
int i = 0;
    while (i < myobj.size()) {
      GameObject obj = myobj.get(i);
      //if (obj instanceof enemy && isCollidingWith(obj) && immuneTimer >= threshold) {
      //  hp -= ((enemy) obj).damage;
      //  //immuneTimer = 0;
      //  //((Bullet) obj).createParticles();
      //}

      if (obj instanceof DroppedItem && isCollidingWith(obj)) {
        DroppedItem item = (DroppedItem) obj;
        if (item.type == GUN) {
           myweapon = item.w;
          item.hp = 0;
          
        }
        if (item.type == HEALTH ) {
          hp = hp + 10;
          item.hp = 0;
          if (hp > 100) {
            hp = 100;
          }
          
        }
   
      }
      i++;
    }

}
}

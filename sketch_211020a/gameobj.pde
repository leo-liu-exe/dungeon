class GameObject {
  PVector loc;
  PVector vel;
  int hp;
  int roomX, roomY;
  int size;
  int f;
  int xp;
  int drop;
   int damage;
   

  GameObject () {
    loc = new PVector (width/2, height/2);
    vel = new PVector(0, 0);
    hp=1;
  }
  void show() {
  }

  void act() {
    loc.add(vel);
    if (loc.x<width*0.1) loc.x =width*  0.1;
    if (loc.x>width*0.9) loc.x =width*  0.9;
    if (loc.y<height*0.1) loc.y =height*  0.1;
    if (loc.y>height*0.9) loc.y =height*  0.9;
  }
  boolean Collidingwith(GameObject myObj) {

    float d = dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y);

    return(roomwith(myObj) && d < f/2 + myObj.f/2 && hp>0);
  }
  boolean roomwith(GameObject myObj) {
    return(roomX == myObj.roomX && roomY == myObj.roomY);
  }
  void explode(int f, int n, int c) {
    int i = 0;
    while (i < n) {
      myobj.add(new Particles(f/4, loc.x, loc.y, c));
      i++;
    }
  }
  boolean inRoomWith(GameObject myObj) {
    return (roomX == myObj.roomX && roomY == myObj.roomY);
  }
  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
    if (inRoomWith(myObj) && d <= size/2 + myObj.size/2 && hp > 0) {
      return true;
    } else {
      return false;
    }
  }
}

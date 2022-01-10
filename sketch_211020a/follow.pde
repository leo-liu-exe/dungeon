class follow extends enemy {

  follow(int x, int y){
    super(100,50, x,y);
  }
  void show(){
   stroke(pink);
      strokeWeight(2);
      fill(green);
      circle(loc.x, loc.y, size);
      fill(black);
      textSize(20);
      text(hp, loc.x, loc.y);
  }
void act(){
super.act();
vel = new PVector(myhero.loc.x-loc.x, myhero.loc.y-loc.y);
vel.setMag(3);

}
}

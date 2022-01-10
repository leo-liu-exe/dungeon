class darknesscell {
  float opacity;
  float x, y, s;
  float d;

  darknesscell(float _x, float _y, float _s) {
    s = _s;
    x=_x;
    y=_y;
    opacity = 0;
  }
  void show() {
    d = dist(myhero.loc.x, myhero.loc.y, x, y );
    opacity= map (d, 0, 500, 0, 255);
    fill(black, opacity);
    noStroke();
    square(x, y, s);
  }

  void act() {
  }
}

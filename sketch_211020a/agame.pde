void game() {
  size(800, 800);
  fill(255);
  drawRoom();
  drawGameObject();
  darkness();
  //drawLightlayer();
  drawminimap();
}
void drawRoom() {
  background(lbrown);
  stroke(black);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  northroom = map.get(myhero.roomX, myhero.roomY-1);
  eastroom = map.get(myhero.roomX+1, myhero.roomY);
  southroom = map.get(myhero.roomX, myhero.roomY+1);
  westroom = map.get(myhero.roomX-1, myhero.roomY);
  noStroke();
  fill(black);
  if (northroom !=#FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastroom !=#FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }

  if (southroom !=#FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westroom !=#FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  rectMode(CENTER);
  stroke(black);
  fill(brown);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void drawGameObject() {
  for (int i=0; i<myobj.size(); i++) {
    GameObject obj = myobj.get(i);
    if (obj.roomX == myhero.roomX && obj.roomY==myhero.roomY) {
      obj.show();
      obj.act();
    }
    if (obj.hp <=0) {
      myobj.remove(i);
      i--;
    }
  }
}

void darkness() {
  int i = 0;
  while ( i < darkness.size()) {
    darknesscell myDark = darkness.get(i);
    myDark.show();
    myDark.act();
    i++;
  }
}


void drawminimap() {
  float s = 10;
  int x = 0, y = 0;
  while (y  <  map.height) {
    color c = map.get(x, y);
    fill(c);
    if (x== myhero.roomX && y ==myhero.roomY) {
      fill(blue);
    }
    square(x*s, y*s, s);

    x=x+1;
    if (x>=map.width) {
      x=0;
      y=y+1;
    }
  }
  darkness.add (new darknesscell(x, y, s));
}

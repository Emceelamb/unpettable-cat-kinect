
class Cat {

  PVector pos, vel, acc;
  float mass;

  Cat() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(1, 0);
    acc = new PVector(0, 0);
    mass =1;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void move() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void display() {
    //stroke(233);
    //strokeWeight(4);
    //ellipse(pos.x, pos.y,20,20);
    //image(bread, pos.x, pos.y);
    image(myAnimation,pos.x,pos.y);
  }

  void checkEdges() {
    if (pos.x>width) {
      vel.x *= -1;
      pos.x = width;
    } else if (pos.x<0) {
      vel.x *=-1;
      pos.x = 0;
    } 

    if (pos.y>height) {
      vel.y *= -0.4;
      pos.y = 0;
    } else if (pos.y<0) {
      vel.y *= -1;
      pos.y = 0;
    }
  }

  void pet() {
    if (mouseX + avatar.width/2 >= pos.x && mouseX - avatar.width/2<= pos.x+bread.width 
      && mouseY + avatar.height/2 >= pos.y && mouseY - avatar.height/2 <= pos.y+bread.height) {
      println("petted " + mouseX);
      fill(#FF00FF);
      textSize(144);
      textMode(CENTER);
      textAlign(CENTER);
      image(meow, width/2, height/2);
      textFont(comic);
      text("MEOW!", width/2, height/2);
      //vel.add(random(-100, 100), random(-100, 100));
      purr.trigger();
    }
  }
}
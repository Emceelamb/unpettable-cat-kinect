
class Hand {
  float mass, g;
  PVector pos;

  Hand() {
    pos = new PVector(width/2, height/2);
    mass = 50;
    g=15;
  }
  
  PVector repel(Cat c){
    PVector force = PVector.sub(pos,c.pos);
    float d = force.mag();
    //d = constrain(d,1.0,20.0);
    d = constrain(d,1.0,6.5);

    force.normalize();
    float strength = (g * mass*c.mass)/(d*d);
    force.mult(strength);
    
    force.mult(-1);
    return force;
  }
  
  void update(){
    pos = new PVector(mouseX,mouseY);
  }
  
  void display(){
    //ellipseMode(CENTER);
    //ellipse(pos.x,pos.y,50,50);
    imageMode(CENTER);
    image(avatar,pos.x,pos.y);
    
  }
}
  
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import gifAnimation.*;
// UNPETTABLE CAT

// Initialize objs

Cat cat;
Hand hand;
PFont comic;
PFont font;
PImage bread,avatar,bg, meow;
Minim minim;
AudioSample purr;

Gif myAnimation;

void setup() {
  //size(1280, 720);
  
  fullScreen();
  bread = loadImage("ascii-nyan1.gif");
  meow = loadImage("bread.png");
  bread.resize(200,0);
  meow.resize(height,0);
  avatar = loadImage("hand.png");
  bg = loadImage("space.jpg");
  //bg.scale(2);
  bg.resize(4800,5800);
  cat = new Cat();
  hand = new Hand();
  comic = createFont("Comic Sans MS Bold", 144);
  
  minim = new Minim(this);
  purr = minim.loadSample("purr.wav", 512);
  font = createFont("ka1.ttf",148);
  
  myAnimation = new Gif(this, "ascii-nyan.gif");
  //myAnimation.resize(300,0);
  myAnimation.play();
  
}

void draw() {
  background(0);
  //for(int x = 0; x<2;x++){
  //image(bg,x*bg.width,0);
  //}
  
    title();

  
  PVector force = hand.repel(cat);
  
  cat.checkEdges();
  cat.applyForce(force);
  cat.move();
  
  hand.update();
  hand.display();
  cat.display();
  cat.pet();
  
}
/**
* I relied HEAVILY on the code samples given in the examples. I did write most myself but there was significant use of the resources given. 
**/

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

PFont f;
PImage img;
int id = 0;

void setup() {
  f = createFont("Courier", 16);
  textFont(f);
  draw();


  size(1920, 1080, P2D);
  noStroke();
  smooth();

  oscP5 = new OscP5(this,12000);
  dest = new NetAddress("127.0.0.1",6448);

}

void oscEvent(OscMessage Message) {
 if (Message.checkAddrPattern("/wek/outputs")==true) {
   println(Message);
     if(Message.checkTypetag("fffff")) { //Now looking for 2 parameters
        float param = Message.get(0).floatValue(); //get this parameter
        float param2 = Message.get(1).floatValue(); //get this parameter
        println(param); //for debugging
        println(param2);
        if (param < param2){
          text("Rap",10,30);
          println("rap");
          id = 1;
          redraw();
        } 
        else {
          text("jazz",10,30);
          println("jazz");
          id = 2;
          redraw();
        }
      }
   }
}


void draw() {
  if(id == 0){
  background(0);
  fill(255);
  text("running and listening",10,20);
  }
  if(id == 1){
  img = loadImage("rapImage.jpg");
  image(img,0,0);
  }
  if(id == 2){
  img = loadImage("jazzImage.jpg");
  image(img,0,0);
  }

    
}
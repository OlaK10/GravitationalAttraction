Sun s;
Earth[] earths = new Earth[10];

void setup() {  
  
 size(640, 360); // widow size
 s = new Sun();
 
 for (int i = 0; i < earths.length; i++) {
   earths[i] = new Earth(random(0.1, 10), random(0, 600), random(0, 300));
 } 
 
}

// Continuously run
void draw() {
  
  background(255);
  
  for (int i = 0; i < earths.length; i++) {
  
   PVector force = s.attract(earths[i]);
   earths[i].applyForce(force);
   earths[i].update();
   earths[i].display();
   earths[i].checkEdges();
  }
  
  s.drag();
  s.hover(mouseX, mouseY);
  s.display();
   
}

void mousePressed() {
 s.clicked(mouseX, mouseY); 
}

void mouseReleased() {
  s.stopDragging(); 
}

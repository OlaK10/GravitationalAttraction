
class Sun {
  
  float mass;
  PVector position;
  boolean dragging = false;
  boolean rollover = false;
  
  PVector dragOffset;
  
  Sun() {
  position = new PVector(width / 2, height / 2);
  mass = 20;
  dragOffset = new PVector(0.0, 0.0);
  }
  
  
  PVector attract(Earth e) {
    
    PVector force = PVector.sub(position, e.position); // subtracts positions to get distance between the two
    float d = force.mag(); // magnitude of the force vector 
    d = constrain(d, 5.0, 25.0);
    force.normalize();
    float strength = (mass * e.mass) / (d*d);
    force.mult(strength);
    return force;
  
  }
  
  void display() {
  ellipseMode(CENTER);
  strokeWeight(1);
  stroke(0);
  if (dragging) fill (50);
  else if (rollover) fill(100);
  else fill(175, 200);
  ellipse(position.x, position.y, mass*2, mass*2);


}

void clicked(int mx, int my) {
  float d = dist(mx, my, position.x, position.y);
  if (d < mass) {
    dragging = true;
    dragOffset.x = position.x - mx;
    dragOffset.y = position.y - my;
  }
}

void hover(int mx, int my) {
  float d = dist(mx, my, position.x, position.y);
  if (d < mass) {
    rollover = true;  
  } else {
  rollover = false;
}
  
}


void stopDragging() {
  dragging = false;
}

void drag() {
  if (dragging) {
  position.x = mouseX + dragOffset.x;
  position.y = mouseY + dragOffset.y;
}

}










}

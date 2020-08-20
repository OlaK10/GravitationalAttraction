
class Earth {
  
  float mass;
  PVector velocity; 
  PVector acc;
  PVector position;

  
  // Earth Constructor
  Earth(float mass, float x, float y) {
    this.mass = mass;
    position = new PVector(x, y); // position and mass will be random
    acc = new PVector(0, 0);
    velocity= new PVector(1, 0);
  }
  
  void applyForce(PVector force) {
    
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void update() {
    velocity.add(acc);
    position.add(velocity);
    acc.mult(0);
  }
 
 void display() {
   stroke(0);
   strokeWeight(2);
   fill(0, 127);
   ellipse(position.x, position.y, mass*2, mass*2);
 }
 
 void checkEdges() {
   if (position.x > width) {
   position.x = 0;
   
 } else if (position.x < 0) {
  position.x = width; 
 }
 
 if (position.y > height) {
   velocity.y *= -1;
   position.y = height;
 }
  
  
  
  }
}

float baseL0 = 10;

float arm1W = 15;
float arm1D = 15;
float arm1L = 30;

float arm2W = 15;
float arm2D = 10;
float arm2L = 5;

float arm3W = 10;
float arm3D = 10;
float arm3L = 10;

float arm4W = 5;
float arm4D = 5;
float arm4L = 40;

float armW1 = 10;
float armW2 = 10;
float armW3 = 5;
float armW4 = 5; 

float angle1 = 0;
float angle2 = 0;
float angle3 = 0;

float dif = 4.0;

int d =20;
float y = -d;
float speed =random(3);


void setup(){
  size(1000,1000, P3D);
  background(#3FA080);
  
  camera(15,-150,10,0,0,20,0,0,-1);
  
  noStroke();  
  ellipseMode(RADIUS);
}

void draw(){
  
  background(#3FA080);
  
  if(keyPressed){
    if(key == 'q'){
      angle1 = angle1 + dif;
    }
    if(key == 'p'){
      angle1 = angle1 - dif;
    }
    if(key == 'w'){
      angle2 = angle2 + dif;
    }
    if(key == 'o'){
      angle2 = angle2 - dif;
    }
    if(key == 'e'){
      angle3 = angle3 + 3*dif;
    }
    if(key == 'i'){
      angle3 = angle3 - 2*dif;
    }
   
    if(key == 'R'){
      angle1 = 0;
      angle2 = 0;
      angle3 = 0;
    }
  }
  
   //base
  xyzAxis(20); //xyzAxis @ base
  translate(0,0,baseL0/2);
  fill(#F2E5C1);
  box(10,10,baseL0);
  
  
  //1st link
  rotateY(radians(angle1));
  rotateZ(radians(angle2));  
  translate(0,0,baseL0-5);
  //go to center of 1st joint
  translate(0,0,arm1L/2);
  fill(#870010);
  box(arm1W,arm1D,arm1L);
  
  //2nd link
  //go to 2nd joint
  translate(arm1D,0,arm1D-5);
  //go to center of 2nd joint
  translate(0,0,arm2L/2);
  fill(#F2E5C1);
  box(arm2W,arm2D,arm2L);
  
  //3rd link
  // go to 3rd joint
  translate(arm2D+1, 0, arm2L/4-6);
  rotateY(radians(angle3));
  // go to center of 3rd joint
  translate(0, 0, arm3L/2);
  fill(0);
  box(arm3W,arm3D,arm3L);
  
  //4th link
  // go to 4th joint
  translate(arm3D-3,0,arm3L/2);
  fill(#7C3C14);
  box(arm4W,arm4D,arm4L);
  
   //ball
  pushMatrix();
  y+=speed;
  if(y > 0){
    y=-200;
  }
  translate(arm3L/2,y,0);
  fill(255);
  sphere(5);
  popMatrix();
  
  //xyzAxis @ Pr
  translate(0, 0, arm4L/2);
  xyzAxis(10);
  
}
  
 

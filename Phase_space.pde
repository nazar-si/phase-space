int iter = 1;
float scale = 200;
int num = 15000;
float decay = 0.3;
point[] points = new point[num];
class point{
   float x;
   float y;
   float px;
   float py;
   float ux;
   float uy;
   float dt = 1.0/60 / iter;
   float lifetime = 4;
   float chance = 0.1;
   float t = 0;
   point(float x, float y){
     spawn(x,y,0,0, x, y);
   }
   point(float x, float y, float ux, float uy){
     spawn(x,y,ux,uy, x, y); 
   }
   void spawn(float x, float y, float ux, float uy, float px, float py){
     this.x = x;
     this.y = y;
     this.px = x;
     this.py = y;
     this.ux = 0;
     this.uy = 0; 
     this.px = px;
     this.py = py;
   }
   void force(float fx, float fy){
     this.ux += fx;
     this.uy += fy;
   }
   void update(){
     this.px = x;
     this.py = y;
     this.x += ux * dt;
     this.y += uy * dt;
     //if (x  + ux * dt > width / 2 / scale)
     //  spawn(this.x - width / scale, this.y, this.ux, this.uy, this.px - width / scale, this.py);
     //if (y + ux * dt > height / 2 / scale)
     //  spawn(this.x, this.y - height / scale, this.ux, this.uy, this.px, this.py - height / scale);
     //if (x  + ux * dt < -width / 2 / scale)
     //  spawn(this.x + width / scale, this.y, this.ux, this.uy, this.px + width / scale, this.py);
     //if (y + ux * dt < -height / 2 / scale)
     //  spawn(this.x, this.y + height / scale, this.ux, this.uy, this.px, this.py + height / scale);
     this.t += dt;
     if (this.t > this.lifetime && random(1.0) > chance){
       this.x = random(-width / 2 / scale, width / 2 / scale);
       this.y = random(-height / 2 / scale, height / 2 / scale);
       this.px = x;
       this.py = y;
       this.t = 0;
       this.ux = 0;
       this.uy = 0;
     }
     this.ux *= decay;
     this.uy *= decay;
   }
   void draw(){
     //colorMode(HSB, TAU, 100, 100);
     //stroke(atan2(this.x-this.px, this.y-this.py) + PI, 100, 100);
     stroke(255,25);
     //stroke(255-20 * sqrt(this.ux * this.ux + this.uy * this.uy), 255-10 * sqrt(this.ux * this.ux + this.uy * this.uy), 255, 30+ 20 * sqrt(this.ux * this.ux + this.uy * this.uy));
     line(this.x * scale, -this.y * scale, this.px * scale, -this.py * scale);  
   }
}


void setup(){
  size(1024, 768);
  background(0);
  for (int i = 0; i < num; i++){
    points[i] = new point(random(-width /2 / scale, width / 2 / scale), random(-height /2 / scale, height /2 / scale)); 
    //points[i] = new point(random(-width /2 / scale, width / 2 / scale), random(-height /2 / scale, 0)); 
    points[i].t -= (num/2 - i) * points[i].lifetime /num;
  }
}

void draw(){
  fill(0, 10);
  rect(0, 0, width, height);
  //background(0);
  translate(width /2, height /2);
  //stroke(255,25);
  strokeWeight(1);
  //float a=2 * mouseX / scale;
  for (int i = 0; i < num; i++){
    for (int j = 0; j < iter; j++){
      float x = points[i].x;
      float y = points[i].y;
      //points[i].force();
      //points[i].force(-y + x * (1 - x * x - y * y), x);
      //points[i].force(y, -y + 2 * (x - x * x * x));
      //points[i].force((1 - x * x) * x, 0);
      //points[i].force(y + x * (1 - x * x - y * y), -x + y * (1 - x * x - y * y));
      //points[i].force(0.1*(y + (x +2) * (1 - (x+2) * (x +2) - y * y)), 0.1*(-(x+2) + y * (1 - (x + 2) * (x + 2) - y * y)));
      //points[i].force(1 - 2 * x, 2 * x - y);
      //points[i].force(y, -y + 0.5 * (x - x * x  * x));
      //points[i].force(-y + x - x * x * x - x * y * y, 0);
      //points[i].force(x * x * x * x + y * y * y * y - 2 * x * x + 4 * y * y + 2 * x * y, -y);
      //points[i].force(y ,-3* y+4* (x-x * x * x));
      //points[i].force(y*y+sin(x)-x*4,x*2+cos(x)-sin(y)*y);
      //points[i].force(sin(sin(x * 3) * cos(y * 3)), cos(cos(x * 3) + sin(y * 3)));
      points[i].force(x * 3 * (3 - 3 * y * y / 2), (cos(x * 3) + sin(y * 3)));
      //if (y<0)
      //float mx = x * scale - mouseX + width /2;
      //float my = y * scale + mouseY - height /2;
      //float len = (mx * mx + my * my) / scale;
      //float m = 20;
      //points[i].force(max(min((mouseX - pmouseX)/len, m),-m), max(min(-(mouseY - pmouseY) / len,m),-m));
      //if (x * x + y * y > a * a / 25)
      //  points[i].force(-3- 4*a*y*y/(x*x + y * y + 1) ,4*a*x*y/(x*x + y * y + 1));
      // else
      //   points[i].force(-1+x/sqrt(x * x + y * y) * (a * a / 25 - x * x - y * y), y/sqrt(x * x + y * y) * (a * a / 25 - x * x - y * y));
      //else
      //  points[i].force(-y + x * (a*a/25-x*x-y*y),y * (a*a/25-x*x-y*y));
      //else
      //  points[i].force(y/sqrt(x*x + y * y),-x/sqrt(x*x + y * y));
      points[i].update();
      points[i].draw();
    }
    
  }
}

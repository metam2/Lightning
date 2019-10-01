PImage photo1;
PImage photo2;
void setup()
{
  	size(500,500);
	background(31, 31, 95);
	frameRate(150);

	int r = randomNumber(100, 255);
	int g = randomNumber(100, 255);
	int b = randomNumber(100, 255);
	stroke(r, g, b);
  photo1 = loadImage("wizard1.PNG");
  photo2 = loadImage("wizard2.png");
}

int slope = 0;
int length = 0;
int thick = 0;
int yCenter = 150;
int x1 = 180;
int y1 = 210;
int x2 = 176;
int y2 = 210;

void draw()
{	
  if (slope < 0)
    image(photo1, 0, 200);
  else
    image(photo2, 0, 200);
    
  fill(20, 20, 50, 4);
  rect(0, 0, width, height);
  if(x1 < width){
  
  	if (length == 0){
  		length = randomNumber(10, 1);
  		slope = randomNumber(10, -10);
  		thick = randomNumber(20, 3);
  	}
  
    //makes slope downward when the line is at the top
  	if (yCenter <= 0){
  		while(slope< 0){
  			slope = randomNumber(10, -10);
  		}
  	}
  
    //makes slope upwards when the line is at the bottom
  	if (yCenter >= 300){
  		while(slope > 0){
  			slope = randomNumber(10, -10);
  		}
  	}
  	length --;
  
  	x1 += 2;
  	x2 += 2;
  	yCenter += slope;
  	y1 = yCenter - thick;
  	y2 = yCenter + thick;
  
  	line(x1, y1, x2, y2);
  
  }

}
void mousePressed()
{
	x1 = 180;
	x2 = 176;
	yCenter = 210;
	int r = randomNumber(100, 255);
	int g = randomNumber(100, 255);
	int b = randomNumber(100, 255);
	stroke(r, g, b);
}

int randomNumber(int min, int max){
	int rand;
	int range = max - min + 1; 
  
  rand = (int)(Math.random() * range) + min; 
  	
  return rand;
}

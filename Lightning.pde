PImage wizardUp;
PImage wizardDown;
int WIZARD_X = 0;
int WIZARD_Y = 200;

int slope = 0;
int length = 0;
int thick = 0;
int yCenter = 150;
int x1 = WIZARD_X ;
int y1 = WIZARD_Y + 10;
int x2 = WIZARD_X + 4;
int y2 = WIZARD_Y + 10;

void setup()
{
  	size(500,500);
	background(31, 31, 95);
	frameRate(150);

	int r = randomNumber(100, 255);
	int g = randomNumber(100, 255);
	int b = randomNumber(100, 255);
	stroke(r, g, b);
  wizardUp = loadImage("wizardUp.PNG");
  wizardDown = loadImage("wizardDown.png");
  
  yCenter = WIZARD_Y + 10;
  x1 = WIZARD_X + wizardUp.width;
  y1 = WIZARD_Y + 10;
  x2 = WIZARD_X + wizardUp.width + 4;
  y2 = WIZARD_Y + 10;
}

void draw()
{	
  if (slope < 0)
    image(wizardUp, 0, 200);
  else
    image(wizardDown, 0, 200);
    
  fill(20, 20, 50, 4);
  rect(-1, -1, width + 1, height + 1);
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

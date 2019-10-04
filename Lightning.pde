PImage wizardUp;
PImage wizardDown;
PImage cloud;
int WIZARD_X = 0;
int WIZARD_Y = 200;

int r, g, b;
int slope = 0;
int length = 0;
int thick = 0;
int yCenter = 150;
int x = WIZARD_X ;
int y1 = WIZARD_Y + 10;
int y2 = WIZARD_Y + 10;

void setup()
{
  	size(500,500);
	background(31, 31, 95);
	frameRate(150);

	r = randomNumber(100, 255);
	g = randomNumber(100, 255);
	b = randomNumber(100, 255);
	stroke(r, g, b);
  wizardUp = loadImage("wizardUp.png");
  wizardDown = loadImage("wizardDown.png");
  cloud = loadImage("cloud.png");
  cloud.resize(wizardUp.width, 145);
  
  yCenter = WIZARD_Y + 10;
  x = WIZARD_X + wizardUp.width;
}

void draw()
{	
    
  fill(20, 20, 50, 4);
  rect(-1, -1, width + 1, height + 1);
  
  fill(31, 31, 95);
  noStroke();
  rect(WIZARD_X, WIZARD_Y - 15, WIZARD_X + 190, WIZARD_Y + wizardUp.height);
  
  image(cloud, 0, WIZARD_Y + wizardUp.height - 80);
  if (slope < 0)
    image(wizardUp, 0, 200);
  else
    image(wizardDown, 0, 200);
  
  if(x < width){
  
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
  
  	x += 2;
  	yCenter += slope;
  
  stroke(r, g, b);
  	line(x, yCenter-thick, x - 4, yCenter + thick);
  
  }

}
void mousePressed()
{
	x = 180;
	yCenter = 210;
	r = randomNumber(100, 255);
	g = randomNumber(100, 255);
	b = randomNumber(100, 255);
	stroke(r, g, b);
}

int randomNumber(int min, int max){
	int rand;
	int range = max - min + 1; 
  
  rand = (int)(Math.random() * range) + min; 
  	
  return rand;
}

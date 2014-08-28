int[] ellipseX = new int[5000];
int backgroundR = 0;
int backgroundG = 50;
int backgroundB = 125;

class Lightning {


void setup(){
  size(500,500);
}
void draw(){
	background(backgroundR, backgroundG, backgroundB);
	noStroke();
	fill(131,131,131);
	for(int i = 0; i<ellipseX.length; i++){
		ellipse(i*100, 0, 180, 180);
	}

}
void mousePressed(){
	fill(255,255,0);
	line(mouseX, 0, Math.ra, 75);
}


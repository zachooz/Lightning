int[] ellipseX = new int[5000];
aLightning[] theLightning = new aLightning[2000];
int lightningCount = 0;


public class aLightning {
	int originalX = mouseX;
	int startX = mouseX;
	int startY = 0;
	int endX = startX;
	int endY = startY + (int) (Math.random()*10);
	int startX2 = mouseX;
	int startY2 = 0;
	int endX2 = startX + (int) (Math.random()*30 - 15);
	int endY2 = startY + (int) (Math.random()*10);
	boolean split = true;
	int r=(int) (Math.random() * 255);
	int g=(int) (Math.random() * 255);
	int b=(int) (Math.random() * 255);
	int theAlpha = 255;
}

void setup(){
  size(500,500);
  strokeWeight (1);
  background(0, 0, 0);
  frameRate(10);
}
void draw(){
  noStroke();
  fill(131,131,131);
  
  background(0, 0, 0, .5);
  for(int i = 0; i<theLightning.length; i++){
		if(theLightning[i]!=null){
				theLightning[i].split = true;
			while(theLightning[i].startY < height || theLightning[i].startY2 < height){
				stroke(theLightning[i].r,theLightning[i].g,theLightning[i].b, theLightning[i].theAlpha);
				fill(theLightning[i].r,theLightning[i].g,theLightning[i].b);
				line(theLightning[i].startX, theLightning[i].startY, theLightning[i].endX, theLightning[i].endY);
				theLightning[i].startX = theLightning[i].endX;
				theLightning[i].startY = theLightning[i].endY;
				theLightning[i].endX =  theLightning[i].startX + (int) (Math.random()*20 - 10);
				theLightning[i].endY = theLightning[i].startY + (int) (Math.random()*20);
				if(theLightning[i].startY >= height/2 && theLightning[i].split){
					theLightning[i].startX2 = theLightning[i].endX;
					theLightning[i].startY2 = theLightning[i].endY;
					theLightning[i].endX2 =  theLightning[i].startX + (int) (Math.random()*20 - 10);
					theLightning[i].endY2 = theLightning[i].startY + (int) (Math.random()*20);
					line(theLightning[i].startX2, theLightning[i].startY2, theLightning[i].endX2, theLightning[i].endY2);
					theLightning[i].split =false;
				}else if(theLightning[i].startY >= height/2){
					theLightning[i].startX2 = theLightning[i].endX2;
					theLightning[i].startY2 = theLightning[i].endY2;
					theLightning[i].endX2 =  theLightning[i].startX2 + (int) (Math.random()*30 - 15);
					theLightning[i].endY2 = theLightning[i].startY2 + (int) (Math.random()*20);
					line(theLightning[i].startX2, theLightning[i].startY2, theLightning[i].endX2, theLightning[i].endY2);
				}
				
			}
			theLightning[i].startY = 0;
			theLightning[i].startX = theLightning[i].originalX;
			theLightning[i].endX =  theLightning[i].startX + (int) (Math.random()*30 - 15);
			theLightning[i].endY = theLightning[i].startY + (int) (Math.random()*20);
		}
	}
  for(int i = 0; i<ellipseX.length; i++){
	noStroke();
    ellipse(i*100, 0, 180, 180);
  }

}
void mousePressed(){
  fill(255,255,0);
  theLightning[lightningCount] = new aLightning();
  lightningCount++;
  if(lightningCount>= 2000){
  	lightningCount = 0;
  }
}


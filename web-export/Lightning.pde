int[] ellipseX = new int[10];
aLightning[] theLightning = new aLightning[2000];
int lightningCount = 0;

public class aLightning {
	int originalX, startX, startY, endX, endY, startX2, startY2, endX2, endY2, r, g, b, theAlpha;
	boolean split;
	aLightning(int originalX, int startX, int startY, int endX, int endY, int startX2, int startY2, int endX2, int endY2, boolean split, int r, int g, int b, int theAlpha){
		this.originalX = originalX;
		this.startX = startX;
		this.startY = startY;
		this.endX = endX;
		this.endY = endY;
		this.startX2 = mouseX;
		this.startY2 = startY2;
		this.endX2 = endX2;
		this.endY2 = endY2;
		this.split = split;
		this.r=r;
		this.g=g;
		this.b=b;
		this.theAlpha = theAlpha;
	}
}

void setup(){
  size(500,500);
  strokeWeight (1);
  background(0, 0, 0);
  frameRate(10);
}
void draw(){
  noStroke();
  fill(0,0,0,50);
  rect(-500,-500,10000,1000,80);
  fill(125, 125, 125);
  
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
  for(int i = 0; i*100<=width+1; i++){
	noStroke();
    ellipse(i*100, 0, 180, 180);
  }

}
void mousePressed(){
  fill(255,255,0);
  theLightning[lightningCount] = new aLightning(mouseX, mouseX, 0, mouseX, (int) (Math.random()*10), mouseX, 0, mouseX + (int) (Math.random()*30 - 15),(int) (Math.random()*10), true,(int) (Math.random() * 255),(int) (Math.random() * 255),(int) (Math.random() * 255), 255);
  lightningCount++;
  if(lightningCount>= 2000){
  	lightningCount = 0;
  }
  fill(255,255,255,50);
  rect(-500,-500,10000,1000,50);
}


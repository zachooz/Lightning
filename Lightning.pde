int[] ellipseX = new int[5000];
aLightning[] theLightning = new aLightning[100];
int lightningCount = 0;

public class aLightning {
	int originalX = mouseX;
	int startX = mouseX;
	int startY = 0;
	int endX = startX + (int) (Math.random()*2 - 1);
	int endY = startY + (int) (Math.random()*10);
	
}

void setup(){
  size(500,500);
  strokeWeight (5);
  background(0, 0, 153);
  frameRate(10);
}
void draw(){
  noStroke();
  fill(131,131,131);
  background(0, 0, 153);

  for(int i = 0; i<theLightning.length; i++){
		if(theLightning[i]!=null){
				int r=255;
				int g=255;
				int b=0;
			while(theLightning[i].startY < height){
				r-=1;
				b-=1;
				stroke(r,g,b);
				line(theLightning[i].startX, theLightning[i].startY, theLightning[i].endX, theLightning[i].endY);
				theLightning[i].startX = theLightning[i].endX;
				theLightning[i].startY = theLightning[i].endY;
				theLightning[i].endX =  theLightning[i].startX + (int) (Math.random()*6 - 3);
				theLightning[i].endY = theLightning[i].startY + (int) (Math.random()*10);
				if(theLightning[i].startY >= height){
				}
				
			}
			theLightning[i].startY = 0;
			theLightning[i].startX = theLightning[i].originalX;
			theLightning[i].endX =  theLightning[i].startX + (int) (Math.random()*6 - 3);
			theLightning[i].endY = theLightning[i].startY + (int) (Math.random()*10);
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
  System.out.println("clicked");

}

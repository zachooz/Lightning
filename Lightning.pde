int[] ellipseX = new int[5000];
Lightning[] theLightning = new Lightning[100];
int lightningCount = 0;
int backgroundR = 0;
int backgroundG = 50;
int backgroundB = 125;

public class Lightning {
	int[][] ligthningParts = new int[100][4];
	int partCount = 0;
	int startX = (int) (Math.random()*width);
	int startY = 0;
	int endX = this.startX + (int) (Math.random()*width * 51 - 25);
	int endY = this.startY + (int) (Math.random()*width * 50);

	void createLightning(){
		while(this.endY<height){
			this.ligthningParts[partCount][0] = this.startX;
			this.ligthningParts[partCount][1] = this.startY;
			this.ligthningParts[partCount][2] = this.endX;
			this.ligthningParts[partCount][3] = this.endY;
			this.partCount++;
			this.newLine();
			System.out.println("creating");
		}

	}
	void newLine(){
		this.startX = this.endX;
		this.startY = this.endY;
		this.endX = this.startX + (int) (Math.random()*width * 51 - 25);
		this.endY = this.startX + (int) (Math.random()*width * 50);
	}
	void drawLighting(){
		for(int i = 0; i<100; i++){
			if(ligthningParts[i]!=null){
				fill(255, 255, 100);
				line(ligthningParts[i][0],ligthningParts[i][1],ligthningParts[i][2],ligthningParts[i][3]);
			}
		}
		
	}
}

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
  for(int i = 0; i<theLightning.length; i++){
  	if(theLightning[i]!=null){
  		theLightning[i].drawLighting();
	}
  }

}
void mousePressed(){
  fill(255,255,0);
  theLightning[lightningCount] = new Lightning();
  theLightning[lightningCount].createLightning();
  lightningCount++;
  System.out.println("clicked");

}

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Lightning extends PApplet {

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
}

public void setup(){
  size(500,500);
  strokeWeight (1);
  background(0, 0, 153);
  frameRate(500);
}
public void draw(){
  noStroke();
  fill(131,131,131);
  background(0, 0, 0);

  for(int i = 0; i<theLightning.length; i++){
		if(theLightning[i]!=null){
				theLightning[i].split = true;
			while(theLightning[i].startY < height || theLightning[i].startY2 < height){
				stroke(theLightning[i].r,theLightning[i].g,theLightning[i].b);
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
public void mousePressed(){
  fill(255,255,0);
  theLightning[lightningCount] = new aLightning();
  lightningCount++;
  if(lightningCount>= 100){
  	lightningCount = 0;
  }
  System.out.println("clicked");

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lightning" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

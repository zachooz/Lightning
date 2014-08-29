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
aLightning[] theLightning = new aLightning[100];
int lightningCount = 0;

public class aLightning {
	int originalX = mouseX;
	int startX = mouseX;
	int startY = 0;
	int endX = startX + (int) (Math.random()*2 - 1);
	int endY = startY + (int) (Math.random()*10);
	
}

public void setup(){
  size(500,500);
  strokeWeight (5);
  background(0, 0, 153);
  frameRate(10);
}
public void draw(){
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
public void mousePressed(){
  fill(255,255,0);
  theLightning[lightningCount] = new aLightning();
  lightningCount++;
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

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
int backgroundR = 0;
int backgroundG = 50;
int backgroundB = 125;
public void setup(){
  size(500,500);
}
public void draw(){
	background(backgroundR, backgroundG, backgroundB);
	noStroke();
	fill(131,131,131);
	for(int i = 0; i<ellipseX.length; i++){
		ellipse(i*100, 0, 180, 180);
	}

}
public void mousePressed(){
	fill(255,255,0);
	
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

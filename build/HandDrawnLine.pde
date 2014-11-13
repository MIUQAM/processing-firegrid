public class HandDrawnLine {
  float sX=0;
  float sY=0;
  float eX=0;
  float lineLength=0;
  float angleX=0;
  float angleY=0;
  float angleZ=0;
  float startWeight=0.0;
  float weight=0.0;
  color lineColor;
  long seed = (long)random(0,10000000);

  public HandDrawnLine (float lineLength, float angleX, float angleY, float angleZ, int weight, color c) {
    this.lineLength = lineLength;
    this.angleX = angleX;
    this.angleY = angleY;
    this.angleZ = angleZ;
    this.weight = weight;
    this.lineColor = c;

    //this.init();
  }

  public void init(){

  }

  public void draw(){

    randomSeed(seed);

    float offNoise = 0;
    float choice = 1;
	  float newChoice = 0;
	  float lx = 0;
	  float distX = 5;
	  float distY = 1;
	  float weight = this.weight;
	 
	  pushMatrix();
	  	rotateZ(angleZ);
	  	rotateX(angleX);
	  	rotateY(angleY);
		  stroke(this.lineColor,255);
		  while((sX+lx)<this.lineLength){
        if (choice == 0){
          newChoice = random(0.5);
        }else if(choice == 1){
          newChoice = random(1);
        }else{
          newChoice = random(0.5,1);
        }
		  	
        weight = noise(offNoise) * this.weight;

        offNoise += 0.1;

		    strokeWeight(weight);
		    line (sX+lx, sY+(choice*distY), sX+lx+distX, sY + (newChoice*distY));

		    choice = newChoice;
		    lx += distX;
		  }
	  popMatrix();
  }
}
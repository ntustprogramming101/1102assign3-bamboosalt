final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
int lifeCount;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

final int HOG_ORI=0;
final int HOG_RIGHT=1;
final int HOG_LEFT=2;
final int HOG_DOWN=3;

final int HEART0=0;
final int HEART1=1;
final int HEART2=2;
final int HEART3=3;


int  heartX, heartY, BLOCK, specing;
int lifeState, hogState;
float hogX, hogY, soilY;
float time=0;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24, hogImg, hogDownImg, hogLeftImg, hogRightImg, lifeImg;
PImage soil0, soil1, soil2, soil3, soil4, soil5;
PImage stone1, stone2;


// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

boolean right= false;
boolean down= false;
boolean left= false;
boolean timee = false;



void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
   lifeImg=loadImage("img/life.png");
   hogImg=loadImage("img/groundhogIdle.png");
   hogDownImg=loadImage("img/groundhogDown.png");
   hogLeftImg=loadImage("img/groundhogLeft.png");
   hogRightImg=loadImage("img/groundhogRight.png");
   soil0=loadImage("img/soil0.png");
   soil1=loadImage("img/soil1.png");
   soil2=loadImage("img/soil2.png");
   soil3=loadImage("img/soil3.png");
   soil4=loadImage("img/soil4.png");
   soil5=loadImage("img/soil5.png");
   stone1=loadImage("img/stone1.png");
   stone2=loadImage("img/stone2.png");
   
   hogX=320.0;
   hogY=80.0;
   soilY=160.0;
  
   BLOCK=80;
   specing=70;
   
   gameState=GAME_START;
   lifeState= HEART2;
   hogState=HOG_ORI;
}


void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
         playerHealth = 2;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game
		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);


   
		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, soilY - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!

   
   
    //Soil 1~4
    for(int firstSoilY=0; firstSoilY<4; firstSoilY++){
    for(int firstSoilX=0; firstSoilX<8; firstSoilX++){
    image(soil0, firstSoilX*80, soilY+firstSoilY*80);
      }
    }
    
    
    //Soil 5~8
     for(int sedSoilY=4; sedSoilY<8; sedSoilY++){
    for(int sedSoilX=0; sedSoilX<8; sedSoilX++){
    image(soil1, sedSoilX*80, soilY+sedSoilY*80);
    }
    }
    
    //stone1~8
    for(int stone=0; stone<8; stone++){
      image(stone1, stone*80, soilY+stone*80);
    }
    
    //Soil 8~12
    for(int thirSoilY=8; thirSoilY<12; thirSoilY++){
    for(int thirSoilX=0; thirSoilX<8; thirSoilX++){
    image(soil2, thirSoilX*80, soilY+thirSoilY*80);
    }
    }
    
    //Soil 12~16
    for(int forSoilY=12; forSoilY<16; forSoilY++){
    for(int forSoilX=0; forSoilX<8; forSoilX++){
    image(soil3, forSoilX*80, soilY+forSoilY*80);
    }
    }
    
    //stone9~16
    for(int row=0; row<2; row++){
     for(int col=0; col<2; col++){
       int stoneSpecing=4*80;
       float stoneX =80+ col*80;
       float stoneY = soilY+80*8+3*row*80;
       image(stone1, stoneX, stoneY);
       image(stone1, stoneX, stoneY+stoneSpecing);
       image(stone1, stoneX+stoneSpecing, stoneY);
       image(stone1, stoneX+stoneSpecing, stoneY+stoneSpecing);
       
        float stoneX1= 3*col*80;
       float stoneY1= soilY+80*8+80+row*80;
        image(stone1, stoneX1, stoneY1);
        image(stone1, stoneX1, stoneY1+stoneSpecing);
        image(stone1, stoneX1+stoneSpecing, stoneY1);
        image(stone1, stoneX1+stoneSpecing, stoneY1+stoneSpecing);
    }
       }
     
    
     //Soil 16~20
    for(int fiveSoilY=16; fiveSoilY<20; fiveSoilY++){
    for(int fiveSoilX=0; fiveSoilX<8; fiveSoilX++){
    image(soil4, fiveSoilX*80, soilY+fiveSoilY*80);
    }
    }
    
    //Soil 20~24
    for(int sixSoilY=20; sixSoilY<24; sixSoilY++){
    for(int sixSoilX=0; sixSoilX<8; sixSoilX++){
    image(soil5, sixSoilX*80, soilY+sixSoilY*80);
    }
    }
    
    //stone 17~24
    for(int row1=0; row1<3; row1++){
     for(int col1=0; col1<3;col1++){
       int stoneSpecing = 2*80; //??
       float stoneX1=col1*80;
       float stoneY1=soilY+80*16+80+row1*80;
       image(stone1, stoneX1+col1*stoneSpecing, stoneY1+row1*stoneSpecing);
       
       float stoneX2=80+col1*80;
       float stoneY2=soilY+80*16+row1*80;
       image(stone1, stoneX2+col1*stoneSpecing, stoneY2+row1*stoneSpecing);
       
       float stoneX22=80+col1*80;
       float stoneY22=soilY+80*16+80+row1*80;
       image(stone1, stoneX22+col1*stoneSpecing, stoneY22+row1*stoneSpecing);
       image(stone2, stoneX22+col1*stoneSpecing, stoneY22+row1*stoneSpecing);   
     }
    }
    for(int row2=0; row2<2; row2++){
      for(int col2=0; col2<2; col2++){
          int stoneSpecing = 2*80;
          float stoneX3=160+col2*80;
          float stoneY3=soilY+80*16+160+row2*80;
          image(stone1, stoneX3+col2*stoneSpecing, stoneY3+row2*stoneSpecing);
      }
      }
       for(int row=0; row<2; row++){
      for(int col=0; col<3; col++){
          int stoneSpecing = 2*80;
         float stoneX12=col*80;
         float stoneY12=soilY+80*16+160+row*80;
         image(stone1, stoneX12+col*stoneSpecing, stoneY12+row*stoneSpecing);
         image(stone2, stoneX12+col*stoneSpecing, stoneY12+row*stoneSpecing);
      }
      }
       for(int row=0; row<3; row++){
      for(int col=0; col<2; col++){
          int stoneSpecing = 2*80;
         float stoneX32=160+col*80;
         float stoneY32=soilY+80*16+row*80;
         image(stone1, stoneX32+col*stoneSpecing, stoneY32+row*stoneSpecing);
         image(stone2, stoneX32+col*stoneSpecing, stoneY32+row*stoneSpecing);
      }
      }
  
   
    // Player hog

    //boundary
    if(hogX>width-80){
    hogX=width-80;
  }
  if(hogX<0){
    hogX=0.0;
  }
  if(hogY>80*5){
    hogY=80*5;
  }
  
  //hog move
 

  switch(hogState){
    case HOG_ORI:
    image(hogImg,hogX,hogY);
    time=0.0;
    break;
    case HOG_RIGHT:
    image(hogRightImg,hogX,hogY);
    hogX+=round(80.0/15.0);
    time++;
    break;
    case HOG_LEFT:
    image(hogLeftImg,hogX,hogY);
    hogX-=round(80.0/15.0);
    time++;
    break;
    case HOG_DOWN:
    image(hogDownImg,hogX,hogY);  
    if(soilY<=-80*18){
    hogY+=round(80.0/15.0);    
    time++;
     }else{hogY+=0;
   soilY-=(80.0/15.0);
   time++;
     } 
     println("soilY:" + soilY );
       if(time>15.0){
      time=0.0;
     timee = false;
     hogState=HOG_ORI;
    }    
    break;
  }
  //fix float
    if(time==15.0){
    hogState=HOG_ORI;
    if(hogX%BLOCK<30){
      hogX=hogX-hogX%BLOCK;
    }else{
      hogX=hogX-hogX%BLOCK+BLOCK;
    }
    if(hogY%BLOCK<30){
      hogY=hogY-hogY%BLOCK;
    }else{
      hogY=hogY-hogY%BLOCK+BLOCK;
    }
    soilY= floor(soilY);

    
    }
   
    
		// Health UI

 int heartX = 10;
 int heartY = 10;
 
    for(int i = 0; i<playerHealth; i++){
 
     image(lifeImg,heartX+i*specing ,heartY);
    }
    if(playerHealth==0){
      gameState=GAME_OVER;
    }
  /* for(int heartX = 10; heartX<10+playerHealth*specing; heartX+=specing){
      image(lifeImg,heartX ,heartY);
      }*/
      
		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
  // init hog
     hogX=320.0;
     hogY=80.0;
     image(hogImg,hogX,hogY);
     //init health
     playerHealth=2;
				
				mousePressed = false;
gameState = GAME_RUN;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
    
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
      if(key==CODED){
  switch(keyCode){
  case RIGHT: 
  if(hogState==HOG_ORI){
  right=true;
  hogState=HOG_RIGHT;
  time=0.0;
  }
  break;
   case DOWN: 
 if(hogState==HOG_ORI){
  down=true;
  hogState=HOG_DOWN;
  time=0.0;
  timee = true;

 }
  break;
   case LEFT: 
if(hogState==HOG_ORI){
   left=true;
  hogState=HOG_LEFT;
  time=0.0;
  break;
  }
  }
}
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
    if(key==CODED){
  switch(keyCode){
  case RIGHT:
 if(hogX>0 && hogState==HOG_ORI){
 // right=false;
  hogState=HOG_RIGHT;
  time=0.0;
  }
  break;
   case DOWN:
   if(hogY+BLOCK<26*BLOCK && hogState==HOG_ORI){
  // down=false;
  hogState=HOG_DOWN;
  time=0.0;
   }
  break;
   case LEFT:
   if(hogState==HOG_ORI){
   left=false;
  hogState=HOG_ORI;
  time=0.0;
   }
  break;
}
  }
}

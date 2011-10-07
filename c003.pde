/*
  clock 003
  2011/10/06T21:37:51
  patrick dwyer
  
  Ulam Spiral inspired clock.
  
  See http://patricknevindwyer.github.com/clocks for more info.
  
*/

PFont clockFont;

void setup() {
   
   clockFont = loadFont("Helvetica-24.vlw");
   size(300, 300);
   
}

void draw() {
 
   background(250);
   
   
   int x = width / 2;
   int y = height / 2;
   
   /*
     0 => -x
     1 => y
     2 => +x
     3 => -y
   */
   int drawDir = 0;
   int stepSize = 2;
   int currentStep = 0;
   int digit = 0;
   int drawSize = 35;
 
   translate(0, drawSize / 3 * 2);
   
   // draw the center
   pd(digit, x, y);
   
   // update to the current placement
   y -= drawSize;
   digit++;
   
   // start the spiral 
   while (digit < 60) {
      
      // draw
      pd(digit, x, y);

      currentStep++;
      
      if (currentStep == stepSize) {
         drawDir++;
         currentStep = 0; 
      }
      
      if (drawDir == 4) {
         currentStep = 0;
         drawDir = 0;
         stepSize += 2; 
         x += drawSize;
         y -= drawSize;
      }
      
      // move
      if (drawDir == 0) {
         x -= drawSize;  
      }
      else if (drawDir == 1) {
         y += drawSize;
      }
      else if (drawDir == 2) {
         x += drawSize;
      }
      else if (drawDir == 3) {
         y -= drawSize;
      }
      

      
      digit++; 
   }
}

void pd(int d, int x, int y) {

   if (minute() == d) {
     fill(160);
   }
   else if (hour() == d) {
     fill(0);
   }
   else {
     fill(240);
   }

   if (minute() == d) {
      noFill();
      stroke(30); 
   }
     
   pushMatrix();   
   if (second() == d) {
      textFont(clockFont, 34);     
      translate(-5, 5);
   }
   else {
      textFont(clockFont, 24);
   }
   
   text(nf(d, 2), x, y);
   popMatrix();
}

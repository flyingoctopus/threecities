
//-----------------------------------------------------------------------------------------
// BLOB DETECTION

void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges) {	
  Blob b;
  EdgeVertex eA,eB;
          
  println("There Are " + bd.getBlobNb() + " Blobs Detected...");
      
  for (int n = 0 ; n < bd.getBlobNb() ; n++) {
    b = bd.getBlob(n);
      if (b!= null) {
      
        // Blobs
        if (drawBlobs) {
          pg.strokeWeight(1);
          pg.noFill();
          pg.stroke(255,0,0);
          pg.rectMode(CORNER);

          // If Blobs Are Within Crop Area
          if(b.xMin > LeftBorder && b.xMin < RightBorder && b.yMin  > TopBorder && b.yMin < BottomBorder) {
            //println("INSIDE");
            
            // If The Blob Is Over A Certain Size
            if(b.w > blobMin && b.w < blobMax) {
              //println("GOLDILOCKS");
              pg.rect(b.xMin * FirstScreenWidth, b.yMin * FirstScreenHeight, b.w * FirstScreenWidth, b.h * FirstScreenHeight);

              int s = 0;
              if(b.w > s) {
                s = n;
              }
              // Set XY to largest blob XY
              blobX = ( (1.0 - bd.getBlob(s).xMin) * FirstScreenWidth);
              blobY = (bd.getBlob(s).yMin * FirstScreenHeight);
              blobIO = 1;
            }
            
          }

        } // draw blobs
        
        // Edges
        if (drawEdges) {
          pg.noFill();
          pg.strokeWeight(2);
          pg.stroke(0, 0, 255);
          pg.beginShape();
            for (int m = 0; m < b.getEdgeNb(); m++) {
              eA = b.getEdgeVertexA(m);
              eB = b.getEdgeVertexB(m);
                if (eA != null && eB != null) {
                  pg.vertex(eA.x * FirstScreenWidth, eA.y * FirstScreenHeight);
                }
            }
          pg.endShape(CLOSE);    
        } // draw edges  
        
      } // null
      
  } // for
  
  if(bd.getBlobNb() == 0){
    //println("Aint Got No Blobs Detected...");
    blobIO = 0;
  }
  
} 

// -------------------------------- //


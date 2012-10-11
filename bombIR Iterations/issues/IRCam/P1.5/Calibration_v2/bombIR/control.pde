
// Radio Button
void CropBox(int a) {
  println("a radio Button event: "+a);
  adjustBox = a;
}

// Camera
 void CAM(boolean theFlag) {
  if(theFlag == true) {
    calibShowCam = true;
  } else if (theFlag == false) {
    calibShowCam = false;
  }
 }
 
// Blob
 void BLB(boolean theFlag) {
  if(theFlag == true) {
    calibShowBlob = true;
  } else if (theFlag == false) {
    calibShowBlob = false;
  }
 }

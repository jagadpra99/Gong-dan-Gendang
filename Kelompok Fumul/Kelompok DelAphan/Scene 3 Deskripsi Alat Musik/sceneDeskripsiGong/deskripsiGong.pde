import ddf.minim.*;
Minim minim;
AudioPlayer backshaun;
AudioPlayer iniGong;
AudioPlayer penjelasanGong;

float xPos = 0;
float xSpeed = 1;
float rhandRotation = 0;
float lhandRotation = 0;
boolean halfwayReached = false;
float delayStartTime = 0;
boolean delayComplete = false;
boolean showGong = false;
boolean showCloud = false;
float s = 0.01;

void setup() {
  size(1280, 720);
  background(143, 225, 255);
  
  minim = new Minim(this);
  backshaun = minim.loadFile("musics/Sad-acoustic-song.mp3");
  iniGong = minim.loadFile("musics/IniGong.mp3");
  penjelasanGong = minim.loadFile("musics/Gong-Merupakan-Alat.mp3");
}

void draw() {
  background(143, 225, 255);
  
  backshaun.play();
  backshaun.setVolume(0);

  // Tanah
  noStroke();
  fill(194, 157, 130);
  rect(0, 650, width, 70);
  
  // Pohon menarik
  for (int i = 100; i <= width; i += 300) {
    fill(101, 67, 33);
    rect(i, 450, 40, 200);
    fill(34, 139, 34);
    ellipse(i + 20, 420, 120, 100);
    ellipse(i - 20, 400, 120, 100);
    ellipse(i + 60, 410, 100, 80);
    ellipse(i - 40, 430, 100, 90);
  }

  // Gerakan karakter
  xPos += xSpeed;

  if (xPos >= width / 2 && !halfwayReached) {
    halfwayReached = true;
    xSpeed = 0;

    float drumX = 160;
    float drumY = 600;
    float handX = xPos + 160;
    float handY = 400;

    rhandRotation = atan2(drumY - handY, drumX - handX) - PI / 2;
    delayStartTime = millis();
    showGong = true;
    iniGong.play();
    showCloud = true;
  }

  if (halfwayReached && millis() - delayStartTime > 4000 && !delayComplete) {
    rhandRotation = 0;
    delayComplete = true;
    xSpeed = -2;
  }

  drawCharacter();

  if (delayComplete && xPos <= 50) {
    xSpeed = 0;
    float leftArmEndX = xPos + 250;
    float leftArmEndY = 200;
    float gongX = 210;
    float gongY = 310;
    float gongLeftX = gongX + 75;
    lhandRotation = atan2(gongY - leftArmEndY, gongLeftX + leftArmEndX) - PI / 2;
    drawCloud();
    penjelasanGong.play();
  }

  if (showGong) {
    fill(107, 77, 44);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Ini Gong", 210, 430);
  }
}

void drawCharacter() {
  float headX = xPos + 200;
  float bodyY = 600;

  // Kepala
  noStroke();
  fill(255, 224, 189);
  ellipse(headX, bodyY - 90, 60, 60);

  // Mata
  fill(255);
  ellipse(headX - 12, bodyY - 95, 12, 12);
  ellipse(headX + 12, bodyY - 95, 12, 12);
  fill(0);
  ellipse(headX - 12, bodyY - 95, 5, 5);
  ellipse(headX + 12, bodyY - 95, 5, 5);

  // Mulut
  fill(189, 104, 104);
  arc(headX, bodyY - 75, 20, 12, 0, PI);

  // Badan
  fill(70, 130, 180);
  rect(headX - 20, bodyY - 60, 40, 60, 10);

  // Kaki
  fill(25, 25, 112);
  rect(headX - 20, bodyY, 15, 45, 5);
  rect(headX + 5, bodyY, 15, 45, 5);

  // Sepatu
  fill(0);
  rect(headX - 22, bodyY + 45, 20, 10, 3);
  rect(headX + 3, bodyY + 45, 20, 10, 3);

  // Tangan kanan (berbentuk manusia, rotasi memukul gong)
   push();
  translate(headX - 20, bodyY - 50); // titik bahu kanan
  rotate(rhandRotation);
  noStroke();
  fill(70, 130, 180); // lengan baju kanan
  rect(-10, 0, 15, 40, 5);
  fill(255, 224, 189); // tangan kanan
  ellipse(-2.5, 45, 20, 20);
  pop();

  // Tangan kiri (berbentuk manusia, rotasi menunjuk gong)
 push();
  translate(headX + 20, bodyY - 50); // titik bahu kiri
  rotate(lhandRotation);
  noStroke();
  fill(70, 130, 180); // lengan baju kiri
  rect(0, 0, 15, 40, 5);
  fill(255, 224, 189); // tangan kiri
  ellipse(7.5, 45, 20, 20);
  pop();

  // Gong
  if (showGong) {
    pushMatrix();
    noStroke();
    scale(s);
    fill(98, 75, 45);
    quad(100, 200, 120, 200, 130, 400, 90, 400);
    quad(300, 200, 320, 200, 330, 400, 290, 400);
    strokeWeight(10);
    stroke(98, 75, 45);
    line(110, 205, 310, 205);
    stroke(150, 117, 74);
    ellipse(210, 310, 150, 150);
    stroke(65, 66, 67);
    strokeWeight(5);
    line(160, 210, 160, 246);
    line(260, 210, 260, 246);
    fill(255);
    noStroke();
    ellipse(213, 310, 20, 20);
    popMatrix();
    if (s <= 1) {
      s += 0.01;
    }
  }
}

void drawCloud() {
  if (showCloud) {
    float cloudSize = 250;
    float cloudX = 700;
    float cloudY = 300;

    noStroke();
    fill(255);
    ellipse(cloudX, cloudY, cloudSize, cloudSize);
    ellipse(cloudX + 300, cloudY, cloudSize * 0.8, cloudSize * 0.8);
    ellipse(cloudX + 80, cloudY - 40, cloudSize * 0.7, cloudSize * 0.7);
    ellipse(cloudX - 100, cloudY - 50, cloudSize * 0.6, cloudSize * 0.6);
    ellipse(cloudX + 80, cloudY + 30, cloudSize * 0.66, cloudSize * 0.66);
    ellipse(cloudX + 230, cloudY - 20, cloudSize * 0.54, cloudSize * 0.54);
    ellipse(cloudX + 150, cloudY - 70, cloudSize * 0.6, cloudSize * 0.6);
    ellipse(cloudX + 60, cloudY + 30, cloudSize * 0.54, cloudSize * 0.54);
    ellipse(cloudX + 220, cloudY + 30, cloudSize * 0.6, cloudSize * 0.6);
    ellipse(cloudX + 60, cloudY - 20, cloudSize * 0.5, cloudSize * 0.5);

    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    String text = "Gong merupakan alat musik yang dimainkan dengan cara dipukul. Alat musik ini terbuat dari lempengan logam yang dibentuk sedemikian rupa, dengan sebuah tonjolan di tengahnya. Gong cukup terkenal di Asia Tenggara dan Asia Timur.";
    float textWidth = cloudSize * 1.6;
    float textHeight = cloudSize;
    textLeading(20);
    text(text, cloudX - textWidth / 2 + 100, cloudY - textHeight / 2 - 10, textWidth, textHeight);
  }
}

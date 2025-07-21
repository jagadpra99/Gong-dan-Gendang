import ddf.minim.*;
Minim minim;
AudioPlayer backsun;
AudioPlayer iniKendang;
AudioPlayer penjelasanKendang;

float xPos = 0;
float xSpeed = 1;
float rhandRotation = 0;
float lhandRotation = 0;
boolean halfwayReached = false;
float delayStartTime = 0;
boolean delayComplete = false;
boolean showKendang = false;
boolean showCloud = false;
float cloudX = 960;
float cloudY = -200;
boolean stopCloud = false;

void setup() {
  size(1280, 720);
  minim = new Minim(this);
  backsun = minim.loadFile("musics/Green-Fields.mp3");
  iniKendang = minim.loadFile("musics/IniKendang.mp3");
  penjelasanKendang = minim.loadFile("musics/penjelasanKendang.mp3");
}

void draw() {
  background(143, 225, 255);

  backsun.play();
  backsun.setVolume(0);

  // Gambar tanah
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
    showKendang = true;
    showCloud = true;
    iniKendang.play();
  }

  if (halfwayReached && millis() - delayStartTime > 4000 && !delayComplete) {
    rhandRotation = 0;
    delayComplete = true;
    xSpeed = -2;
  }

  if (delayComplete && xPos <= 50) {
    xSpeed = 0;
    float leftArmEndX = xPos + 240;
    float leftArmEndY = 380;
    if (!stopCloud) cloudY += 5;
    float leftArmRotation = atan2(cloudY - leftArmEndY, cloudX - leftArmEndX) - PI / 2;
    lhandRotation = leftArmRotation;
    if (cloudY == 300) {
      stopCloud = true;
      penjelasanKendang.play();
    }
  }

  drawCloud();
  drawCharacter();

  if (showKendang) {
    fill(107, 77, 44);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Kendang", 225, 120);
  }
}

void drawCharacter() {
  float headX = xPos + 200;
  float bodyY = 600;

  fill(255, 224, 189);
  ellipse(headX, bodyY - 90, 60, 60);

  fill(255);
  ellipse(headX - 12, bodyY - 95, 12, 12);
  ellipse(headX + 12, bodyY - 95, 12, 12);
  fill(0);
  ellipse(headX - 12, bodyY - 95, 5, 5);
  ellipse(headX + 12, bodyY - 95, 5, 5);

  fill(189, 104, 104);
  arc(headX, bodyY - 75, 20, 12, 0, PI);

  fill(70, 130, 180);
  rect(headX - 20, bodyY - 60, 40, 60, 10);

  fill(25, 25, 112);
  rect(headX - 20, bodyY, 15, 40, 5);
  rect(headX + 5, bodyY, 15, 40, 5);

  fill(0);
  rect(headX - 22, bodyY + 40, 20, 10, 3);
  rect(headX + 3, bodyY + 40, 20, 10, 3);

  // Tangan kanan
  push();
  translate(headX - 20, bodyY - 50);
  rotate(rhandRotation);
  noStroke();
  fill(70, 130, 180);
  rect(-10, 0, 15, 40, 5);
  fill(255, 224, 189);
  ellipse(-2.5, 45, 20, 20);
  pop();

  // Tangan kiri
  push();
  translate(headX + 20, bodyY - 50);
  rotate(lhandRotation);
  noStroke();
  fill(70, 130, 180);
  rect(0, 0, 15, 40, 5);
  fill(255, 224, 189);
  ellipse(7.5, 45, 20, 20);
  pop();

  if (showKendang) {
    noStroke();
    fill(107, 77, 44);
    quad(135, 190, 314, 190, 285, 400, 160, 400);
    fill(255);
    arc(223, 400, 125, 25, radians(360), radians(540));
    fill(64, 62, 59);
    rect(160, 395, 125, 5);
    ellipse(224, 190, 180, 50);
    fill(255);
    ellipse(224, 184, 180, 50);
  }
}

void drawCloud() {
  if (showCloud) {
    fill(255);
    noStroke();
    ellipse(680, cloudY, 500, 300);
    ellipse(980, cloudY, 400, 220);
    ellipse(860, cloudY - 40, 350, 200);
    ellipse(780, cloudY - 50, 300, 180);
    ellipse(860, cloudY + 30, 330, 200);
    ellipse(1010, cloudY - 20, 270, 160);
    ellipse(930, cloudY - 70, 300, 140);
    ellipse(840, cloudY + 30, 270, 140);
    ellipse(1000, cloudY + 30, 300, 180);
    ellipse(840, cloudY - 20, 250, 140);

    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    String text =
      "Kendang atau gendang adalah jenis alat musik membranofon yang terbuat dari kulit. Keberadaannya sendiri dipercaya sudah ada sejak zaman logam prasejarah di Indonesia, alias zaman perunggu. Bentuknya sangat sederhana: sepotong batang kayu berongga yang ujungnya ditutup kulit ikan atau reptil. Alat tersebut dimainkan dengan ditepuk.";
    float textWidth = 420;
    float textHeight = 240;
    float cloudX = 860;
    text(text, cloudX - textWidth / 2 - 60, cloudY - textHeight / 2, textWidth, textHeight);
  }
}

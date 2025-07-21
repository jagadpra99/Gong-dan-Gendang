import ddf.minim.*;
AudioPlayer lagu;
AudioPlayer musik;
Minim minim;

float xSpeed = 2;
float xPos = 640;

// Warna
color white = color(255);
color black = color(0);
color brown = color(139, 69, 19);
color darkBrown = color(101, 67, 33);
color green = color(0, 128, 0);
color blue = color(0, 0, 255);
color yellow = color(255, 255, 0);
color lgreen = color(50, 205, 50);
color skin = color(255, 224, 189);
color shirt = color(70, 130, 180);
color pants = color(25, 25, 112);

float s = 0.01;

void setup() {
  size(1280, 720);
  
  minim = new Minim(this);
  lagu = minim.loadFile("haris.mp3");
  musik = minim.loadFile("Sad-acoustic-song.mp3");
  lagu.play();
  musik.play();
}

void draw() {
  background(white);
  
  // Lantai
  fill(brown);
  rect(0, 600, 1280, 120);

  // Dinding
  fill(white);
  rect(0, 0, 1280, 600);
  
  // === Papan tulis menarik ===
  pushMatrix();
  translate(640, 250);
  scale(s);
  s += 0.009;
  if (s > 1) s = 1;
  
  // Bingkai papan
  strokeWeight(10);
  stroke(darkBrown);
  fill(green);
  rect(-450, -160, 900, 320, 20);

  // Dekorasi papan
  fill(yellow);
  ellipse(-400, -120, 20, 20);
  ellipse(400, -120, 20, 20);

  // Teks papan
  fill(white);
  textAlign(CENTER);
  textSize(32);
  text("Tema: Alat Musik Tradisional Yogyakarta", 0, -40);
  text("Gong dan Gendang", 0, 10);
  popMatrix();
  
  // === Karakter mirip manusia ===
  float headX = xPos + 200;
  float bodyY = 520;

  // Kepala
  noStroke();
  fill(skin);
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
  fill(shirt);
  rect(headX - 20, bodyY - 60, 40, 60, 10);

  // Lengan
  fill(shirt);
  rect(headX - 35, bodyY - 60, 15, 40, 10);
  rect(headX + 20, bodyY - 60, 15, 40, 10);

  // Tangan
  fill(skin);
  ellipse(headX - 27, bodyY - 20, 15, 15);
  ellipse(headX + 28, bodyY - 20, 15, 15);

  // Kaki
  fill(pants);
  rect(headX - 20, bodyY, 15, 45, 5);
  rect(headX + 5, bodyY, 15, 45, 5);

  // Sepatu
  fill(0);
  rect(headX - 22, bodyY + 45, 20, 10, 3);
  rect(headX + 3, bodyY + 45, 20, 10, 3);

  // Gerakan karakter
  xPos += xSpeed;
  if (xPos >= width - 250 || xPos <= -150) {
    xSpeed *= -1;
  }
}

void stop() {
  musik.close();
  lagu.close();
  minim.stop();
  super.stop();
}

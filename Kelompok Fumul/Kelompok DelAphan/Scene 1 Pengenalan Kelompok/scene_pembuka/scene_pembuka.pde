import processing.core.PFont;
import ddf.minim.*;
AudioPlayer lagu;
Minim minim;
PImage backgroundImg;
String[] anggotaKelompok = {
  "Muhammad Raynor Athaillah (23523055)",
  "Muhammad Athaya Fathin Adani (23523008)",
  "Jagad Budi Prasetyo (21523147)"
};
float textX;
float textY;
float textSpeed;
int counter;
PFont font;

void setup() {
  size(1280, 720);
  minim = new Minim(this);
  lagu = minim.loadFile("Sad-acoustic-song.mp3");
  lagu.play();
  
  // Memuat gambar langit
  backgroundImg = loadImage("langit.jpg");
  
  // Mengatur awal posisi teks
  textX = -200; // Mulai di luar jendela
  textY = height / 2;
  
  // Mengatur kecepatan teks
  textSpeed = 3;
  
  // Inisialisasi counter
  counter = -1;
  
  // Memuat font teks
  font = createFont("Times New Roman", 30); // Menggunakan font Arial dengan ukuran 30
  
  // Mengatur font teks
  textFont(font);
}

void draw() {
  // Menggambar langit
  background(255);
  image(backgroundImg, 0, 0);
  
  // Menggerakkan teks
  textX += textSpeed;
  
  // Jika teks mencapai batas kanan jendela, kembali ke posisi awal di luar kiri
  if (textX > width) {
    textX = -200;
    
    // Meningkatkan counter saat teks mencapai batas kanan
    counter++;
    
    // Jika counter melebihi jumlah anggota kelompok, reset ke -1
    if (counter >= anggotaKelompok.length) {
      counter = -1;
    }
  }
  
  // Menampilkan teks kelompok
  if (counter == -1) {
    fill(0);
    textSize(70);
    textAlign(LEFT);
    text("Kelompok Funmul", textX, textY);
  }
  
  // Menampilkan teks anggota kelompok
  if (counter >= 0) {
    fill(0);
    textSize(50);
    textAlign(LEFT);
    text(anggotaKelompok[counter], textX + ((counter + 1) * 100), textY + 40);
  }
}

void stop(){
  lagu.close();
  minim.stop();
  super.stop();
}

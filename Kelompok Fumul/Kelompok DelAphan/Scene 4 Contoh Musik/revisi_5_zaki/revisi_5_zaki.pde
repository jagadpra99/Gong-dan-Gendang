import ddf.minim.*;

AudioPlayer lagu;
Minim minim;

float lhandRotation = 0;        // rotasi sudut tangan kiri

float angle = 0; // sudut rotasi kincir

float x = 640; // posisi horizontal karakter
float y = 300; // posisi vertikal karakter
float xSpeed = 1; // kecepatan horizontal karakter

float drumX = x + 80; // posisi horizontal gendang
float drumY = y + 200; // posisi vertikal gendang

void setup() {
  size(1280, 720);

  minim = new Minim(this);
  lagu = minim.loadFile("lagugendang.mp3");
  lagu.play();
}

void draw() {
  // warna latar belakang
  background(255, 255, 255);
 

  // pohon kanan bagian kiri
  fill(139, 69, 19); // Warna coklat
  rect(975, 350, 40, 150); // Batang pohon
  fill(34, 139, 34); // Warna hijau
  triangle(950, 350, 1040, 350, 990, 200); // Daun pohon bagian bawah
  triangle(960, 300, 1030, 300, 990, 150); // Daun pohon bagian tengah
  triangle(970, 250, 1020, 250, 990, 100); // Daun pohon bagian atas

  // pohon kiri bagian kiri
  fill(139, 69, 19); // Warna coklat
  rect(165, 350, 40, 150); // Batang pohon
  fill(34, 139, 34); // Warna hijau
  triangle(140, 350, 230, 350, 180, 200); // Daun pohon bagian bawah
  triangle(150, 300, 220, 300, 180, 150); // Daun pohon bagian tengah
  triangle(160, 250, 210, 250, 180, 100); // Daun pohon bagian atas

  // pohon kiri bagian kanan
  fill(139, 69, 19); // Warna coklat
  rect(285, 350, 40, 150); // Batang pohon
  fill(34, 139, 34); // Warna hijau
  triangle(260, 350, 350, 350, 300, 200); // Daun pohon bagian bawah
  triangle(270, 300, 340, 300, 300, 150); // Daun pohon bagian tengah
  triangle(280, 250, 330, 250, 300, 100); // Daun pohon bagian atas

  // pohon kanan bagian kanan
  fill(139, 69, 19); // Warna coklat
  rect(1085, 350, 40, 150); // Batang pohon
  fill(34, 139, 34); // Warna hijau
  triangle(1060, 350, 1150, 350, 1100, 200); // Daun pohon bagian bawah
  triangle(1070, 300, 1140, 300, 1100, 150); // Daun pohon bagian tengah
  triangle(1080, 250, 1130, 250, 1100, 100); // Daun pohon bagian atas

  // rumah
  fill(154, 206, 236);
  rect(400, 300, 500, 250);

  // atap
  fill(255, 117, 56);
  triangle(350, 300, 650, 80, 950, 300);

  // kincir angin
  fill(128, 128, 0);
  rect(505, 90, 10, 90); //tiang kincir
  pushMatrix();
  translate(510, 100); //pusat rotasi ke tengah bilah
  rotate(angle); //putar bilah sebesar sudut
  fill(255, 127, 0);
  rect(-10, -50, 20, 100); //bilah 1
  rect(-50, -10, 100, 20); //bilah 2
  popMatrix();
  angle += 0.1; //sudut rotasi setiap frame

  // pintu
  fill(255, 231, 181);
  rect(600, 350, 100, 550);
  
  //teralis
  fill(255,0,0);
  rect(490,350,80,80);

  // jendela
  fill(255);
  rect(450, 350, 80, 80);
  // jendela
  fill(255);
  rect(750, 350, 80, 80);
  


  //Tirai kiri
  fill(255, 127, 0);
  rect(0, 0, 100, 500);

  //Tirai kanan
  fill(255, 127, 0);
  rect(1175, 0, 100, 500);

  // panggung
  fill(128, 128, 0); // Warna coklat
  rect(0, 500, 1280, 220); // Bentuk persegi panjang
  
      //gambar ilustrasi gong
       fill(128,0,0);
  rect(110,550,290,20);//tiang atas
          fill(0,0,0);//lingkaran besar
  ellipse(250,600,150,150);
  
      fill(255,215,0);//lingkaran sedang
  ellipse(250,600,100,100);
      
  fill(0,0,0); //lingkaran kecil
  ellipse(250,600,50,50);
  
  fill(128,0,0);
  rect(125,550,20,150);//tiang kiri
  fill(128,0,0);
  rect(355,550,20,150);//tiang kanan



  // kepala
  fill(255, 204, 153); // Warna kulit
  ellipse(x, y, 200, 200); // Bentuk lingkaran

  // rambut
  fill(0); // Warna hitam
  strokeWeight(5); // Ketebalan garis
  curve(x - 40, y - 100, x - 40, y - 50, x + 40, y - 50, x + 40, y - 100); // Rambut atas
  endShape(CLOSE);

  // telinga
  fill(255, 204, 153); // Warna kulit
  ellipse(x - 100, y, 40, 40); // Telinga kiri
  ellipse(x + 100, y, 40, 40); // Telinga kanan

  // mata
  fill(0, 0, 0); // Warna hitam
  ellipse(x - 40, y - 10, 20, 20); // Mata kiri
  ellipse(x + 40, y - 10, 20, 20); // Mata kanan

  // hidung
  triangle(x, y + 10, x - 10, y + 30, x + 10, y + 30); // Bentuk segitiga

  // mulut
  fill(255, 0, 0); // Warna merah
  arc(x, y + 50, 80, 80, PI / 6, 5 * PI / 6); // Bentuk busur

  // badan
  fill(31, 117, 254); // Warna abu-abu
  rect(x - 80, y + 100, 160, 220); // Bentuk persegi panjang

  // tangan kiri
  strokeWeight(10); // Ketebalan garis
  pushMatrix();
  translate(x - 80, y + 100); // Pindahkan titik asal ke posisi tangan
  rotate(radians(lhandRotation)); // Rotasi sudut tangan kiri
  line(0, 0, -90, 120); // Tangan kiri

  // Jari tangan kiri
  line(-90, 120, -110, 140); // Jari kiri pertama
  line(-90, 120, -100, 160); // Jari kiri kedua
  line(-90, 120, -80, 160); // Jari kiri ketiga
  line(-90, 120, -70, 140); // Jari kiri keempat

  popMatrix();

  // tangan kanan (tetap diam)
  strokeWeight(10); // Ketebalan garis
  line(x + 80, y + 100, x + 140, y + 200); // Tangan kanan
  line(x + 140, y + 200, x + 160, y + 210); // Jari kanan pertama
  line(x + 140, y + 200, x + 130, y + 220); // Jari kanan kedua
  line(x + 140, y + 200, x + 150, y + 220); // Jari kanan ketiga
  line(x + 140, y + 200, x + 160, y + 210); // Jari kanan keempat

  // kaki
  strokeWeight(10); // Ketebalan garis
  line(x - 40, y + 400, x - 40, y + 300); // Kaki kiri
  line(x + 40, y + 400, x + 40, y + 300); // Kaki kanan
  endShape(CLOSE);

  // sepatu
  fill(0, 0, 0); // Warna hitam
  beginShape();
  vertex(x - 70, y + 400); // Titik awal bentuk sepatu kiri
  bezierVertex(x - 50, y + 380, x - 20, y + 390, x - 20, y + 420); // Lengkungan sepatu kiri
  bezierVertex(x - 20, y + 450, x - 70, y + 450, x - 70, y + 400); // Lengkungan sepatu kiri
  endShape(CLOSE);

  beginShape();
  vertex(x + 70, y + 400); // Titik awal bentuk sepatu kanan
  bezierVertex(x + 50, y + 380, x + 20, y + 390, x + 20, y + 420); // Lengkungan sepatu kanan
  bezierVertex(x + 20, y + 450, x + 70, y + 450, x + 70, y + 400); // Lengkungan sepatu kanan
  endShape(CLOSE);

  // Gendang
  fill(165, 42, 42); // Warna coklat
  ellipse(drumX, drumY, 140, 65); // Bentuk lingkaran

  fill(255, 253, 208); // Warna kuning muda
  ellipse(drumX - 48, drumY, 45, 45); // Lingkaran kecil di sebelah kiri gendang

  // Mengubah posisi karakter
  x += xSpeed; // kecepatan horizontal karakter
  drumX += xSpeed; // kecepatan horizontal gendang

  // Membalik arah pergerakan saat mencapai batas layar
  if (x > width || x < 0) {
    xSpeed *= -1;
  }
  if (drumX > width || drumX < 0) {
    xSpeed *= -1;
  }

  // Menggerakkan tangan kiri secara otomatis
  lhandRotation = map(sin(frameCount * 0.05), -1, 1, -90, 0);
}

void stop() {
  lagu.close();
  minim.stop();
  super.stop();
}

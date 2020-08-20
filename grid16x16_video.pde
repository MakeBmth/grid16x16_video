import processing.video.*;

String filename = "d:/Video/bighero6.mp4";

float zoom = 2;

OPC opc;
Movie movie;
//PGraphics[] pyramid;

void setup()
{
  size(800, 800);
  background(255);

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  println(width /16);
  println(height/16);

  opc.ledGrid8x8(0 * 64, width * 1/4, height * 1/4, height/16, 0, true);
  opc.ledGrid8x8(1 * 64, width * 3/4, height * 1/4, height/16, 0, true);
  opc.ledGrid8x8(2 * 64, width * 1/4, height * 3/4, height/16, 0, true);
  opc.ledGrid8x8(3 * 64, width * 3/4, height * 3/4, height/16, 0, true);
  
  
  //opc.ledGrid8x8(4 * 64, width * 1/8, height * 3/4, height/16, 0, true);
  //opc.ledGrid8x8(5 * 64, width * 3/8, height * 3/4, height/16, 0, true);
  //opc.ledGrid8x8(6 * 64, width * 5/8, height * 3/4, height/16, 0, true);
  //opc.ledGrid8x8(7 * 64, width * 7/8, height * 3/4, height/16, 0, true);

  movie = new Movie(this, filename);
  movie.loop();

}

void keyPressed() {
  if (key == 'd') opc.setDithering(false);
  if (key == ' ') movie.pause(); 
  if (key == ']') zoom *= 1.1;
  if (key == '[') zoom *= 0.9;
}

void keyReleased() {
  if (key == 'd') opc.setDithering(true);
  if (key == ' ') movie.play();
}  

void movieEvent(Movie m)
{
  m.read();
}

void draw()
{
  // Scale to width, center height
  background(0);
  int border = 120;
  image(movie, 0, border, width, height-(2*border));
}

import processing.video.*;

String filename = "/path/to/your_video.mp4";

//We can use this to mess with the aspect ratio of the video as the grid is currently 1:1
int verticalBorder = 0;  //Bars at the sides of the display
int horizontalBorder = 0;  //Bars at the top and bottom of display

OPC opc;
Movie movie;

void setup()
{
  size(800, 800);
  background(255);

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Define where the grids are etc
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
  background(0); // Set background to show black borders
  image(movie, verticalBorder, horizontalBorder, width-(2*verticalBorder), height-(2*horizontalBorder));  // Draw a frame of video
}

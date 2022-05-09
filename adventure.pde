ArrayList<Frame> frames = new ArrayList<Frame>();
int currentFrame;

boolean editingMode = false;

float widthPercentage;
float heightPercentage;

void setup() {
  size(1280, 720);
  widthPercentage=width/100.;
  println(widthPercentage);
  heightPercentage=height/100.;
  noStroke();
  listboxSetup(frames);
  botaoInput();
  
  
  
  //setupScenes();
  //setupHotspots();
  saveState();
}

void draw() {
  background(125);
  if(frames.size()!=0){
  image(frames.get(currentFrame).frameImg, int(5*widthPercentage), int(10*heightPercentage));
  frames.get(currentFrame).hotspotDrawHandler();}

    /*if (keyPressed && key==' ') {
    Frames.setWidth(mouseX);
  }*/
  //botaoImagem();
}

void keyPressed() {
  switch (keyCode) {
    case 32: // espaço
      editingMode = !editingMode;
      if (frames.get(currentFrame).selectedHotspot != null) {
        frames.get(currentFrame).selectedHotspot.selected = false;
        frames.get(currentFrame).selectedHotspot = null;
      }
      break;
     case 69: //E
       if (frames.get(currentFrame).selectedHotspot != null)
         frames.get(currentFrame).hotspots.remove(frames.get(currentFrame).selectedHotspot);
       break;
  }
  listboxKey();
}

void mousePressed() {
  frames.get(currentFrame).hotspotMousePressedHandler();
}

void mouseReleased() {
  frames.get(currentFrame).hotspotMouseReleasedHandler();
}
void limiteEdicao(){//limitar os hotspots para não sair das bordas

}

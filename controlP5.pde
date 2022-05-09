import controlP5.*;

ControlP5 cp5;

ListBox Lista;

int cnt = 0;


void controlEvent(ControlEvent theEvent) {
  // ListBox is if type ControlGroup.
  // 1 controlEvent will be executed, where the event
  // originates from a ControlGroup. therefore
  // you need to check the Event with
  // if (theEvent.isGroup())
  // to avoid an error message from controlP5.

  if (theEvent.isGroup()) {
    // an event from a group e.g. scrollList
    println(theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  }

  if (theEvent.isGroup() && theEvent.getName().equals("myList")) {
    int test = (int)theEvent.getGroup().getValue();
    println("test "+test);
  }
}

void listboxSetup(ArrayList lista) {
  cp5 = new ControlP5(this);

  // ListBox is DEPRECATED, 
  // use ScrollableList instead, 
  // see example ControlP5scrollableList

  Lista = cp5.addListBox("myList")
    .setPosition(widthPercentage*50, 0)
    .setSize(int(widthPercentage*50), int(heightPercentage*10))
    .setItemHeight(int(heightPercentage*5))
    .setBarHeight(int(heightPercentage*5))
    .setColorBackground(color(255, 128))
    .setColorActive(color(0))
    .setColorForeground(color(255, 100, 0))
    ;

  Lista.getCaptionLabel().toUpperCase(true);
  Lista.getCaptionLabel().set("frames");
  Lista.getCaptionLabel().setColor(#000000);
  for (int i=0; i<=lista.size(); i++) {
    Lista.addItem("frame "+i, i);
    Lista.getItem("frame "+i).put("color", new CColor().setBackground(#ee8855));
  }
}
void listboxKey() {
  if (key=='0') {
    // will activate the listbox item with value 5
    Lista.setValue(5);
  }
  if (key=='1') {
    // set the height of a listBox should always be a multiple of itemHeight
    Lista.setHeight(210);
  } else if (key=='2') {
    // set the height of a listBox should always be a multiple of itemHeight
    Lista.setHeight(120);
  } else if (key=='3') {
    // set the width of a listBox
    Lista.setWidth(200);
  } else if (key=='i') {
    // set the height of a listBoxItem, should always be a fraction of the listBox
    Lista.setItemHeight(30);
  } else if (key=='u') {
    // set the height of a listBoxItem, should always be a fraction of the listBox
    Lista.setItemHeight(10);
    //Frames.setBackgroundColor(color(100, 0, 0));
  } else if (key=='a') {
    int n = (int)(random(100000));
    Lista.addItem("item "+n, n);
  } else if (key=='d') {
    Lista.removeItem("item "+cnt);
    cnt++;
  } else if (key=='c') {
    Lista.clear();
  }
}
void botaoImagem() {
  int aX=width/10;
  int aY=height/10;
  fill(0, 0, 255);
  rect(0, 9*aY, 2*aX, aY);
  
}
void botaoInput(){
cp5.addButton("EscolherImagem")
   //Set the position of the button : (X,Y)
   .setPosition(0,0)
   //Set the size of the button : (X,Y)
   .setSize(int(widthPercentage*50),int(heightPercentage*10))
   //Set the pre-defined Value of the button : (int)
   .setValue(0)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.RELEASE);
   ;
}
public void EscolherImagem(int value){
// This is the place for the code, that is activated by the buttonb
//println("Button pressed");
  selectInput("Selecione uma imagem para prosseguir:", "fileSelected");
  
}
void fileSelected(File selection) {
  if (selection == null) {
    println("Imagem não selecionada.");
  } else if(checkImg(selection)) {
    frames.add(new Frame(selection.getAbsolutePath()));
    for (int i=0; i<=frames.size(); i++)
    Lista.addItem("frame "+i, i);
    
  }
  else if(!checkImg(selection)){
  println("Arquivo Inválido");
  selectInput("Selecione uma imagem para prosseguir:", "fileSelected");
  }
}
public boolean checkImg(File file) {
   String fileName = file.getName().toUpperCase();
   return fileName.endsWith(".JPG") || fileName.endsWith(".JPEG") || fileName.endsWith(".PNG");
}

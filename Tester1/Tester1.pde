void setup() {
  size(1000, 500);
  //smooth(8);
  //stroke(50, 20);
}

boolean[] bits = {false, false, false, false};
//byte bit0 = 0b0, bit1 = 0b0, bit2 = 0b0, bit3 = 0b0;
int squareHeight = 100, squareWidth = 100;
int x0 = 100, y0 = 30;
int stepSq = 50;
color ButtonColor = #48D464;
color BackgroundColor = #E9EEF5;


void PrintBitVal(boolean[] bits){
  for (int i = 0; i < bits.length; i++){
    // print val
    textSize(50);
    fill(150);
    int coordX = x0 + (squareWidth + stepSq) * i + squareWidth / 2 - 15;
    int coordY = y0 + squareHeight / 2 + 15;
    if (bits[i]) text("1", coordX, coordY);
    else text("0", coordX, coordY);
    
    // print index
    textSize(20);
    fill(30);
    coordX -= 30;
    coordY = y0 - 5;
    text("bit #" + i + ":", coordX, coordY);
  }
}

byte ConvertMessage(boolean[] boolBits){
  byte result = 0b0;
  byte[] bits = new byte[4];
  bits[0] = 1; //0b0000001
  bits[1] = 2; //0b0000010
  bits[2] = 4; //0b0000100
  bits[3] = 8; //0b0001000 
  for (int i = 0; i < bits.length; i++){
    if (boolBits[i]) result = byte(result + bits[i]);
  }
  return result;
}


void DrawSquare(boolean[] bits){
  for (int i = 0;  i < bits.length; i++){
    if (bits[i]) fill(ButtonColor);
    else fill(255);
    int x1 = x0 + (squareWidth + stepSq) * i, x2 = x1;
    int x3 = squareWidth + x1, x4 = x3;
    int y1 = y0, y2 = y0 + squareHeight;
    int y3 = y0 + squareHeight, y4 = y0;
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
}

void draw(){
  background(BackgroundColor);
  
  //Чтение с клавиатуры:
  if (keyPressed){
    switch (key){
      case '1': bits[0] = !bits[0];
      break;
      case '2': bits[1] = !bits[1];
      break;
      case '3': bits[2] = !bits[2];
      break;
      case '4': bits[3] = !bits[3];
      break;
      case ENTER:
        byte message = ConvertMessage(bits);
        println(message);
        break;
    }
    delay(180);
  }
  
  //Отрисовываем квадратики:
  DrawSquare(bits);
  PrintBitVal(bits);
  
  
 
}

public class Cell implements Cloneable{
  private int posX;
  private int posY;
  private char kind;
  private boolean footPrint = false;

  public void setPosX(int i){
    this.posX = i;
  }

  public void setPosY(int i){
    this.posY = i;
  }

  public void setKind(char c){
    this.kind = c;
  }

  public boolean isStart(){
    return kind == 'S';
  } 

  public boolean isGoal(){
     return kind == 'G'; 
  }
  
  public void onFoot(){
    this.footPrint = true;
  }

  public boolean isMovable(){
    return kind == 'G' || kind == ' ';
  }
  
  public boolean isNext(Cell c){
    if(this.posX == c.posX && isMovable()){
      return Math.abs(this.posY - c.posY) == 1;
    } else if(this.posY == c.posY && isMovable()){
      return Math.abs(this.posX - c.posX) == 1;
    } else {
      return false; 
    }
  }

  public Cell clone() throws CloneNotSupportedException{
    return (Cell)super.clone();
  }

  public String toString(){
    return "posX=" + posX + ",posY=" + posY + ",kind=" + kind + ",footPrint=" + footPrint;
  }
}

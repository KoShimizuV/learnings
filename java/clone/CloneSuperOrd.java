public class CloneSuperOrd implements Cloneable{
  Ordinary c1;
  int x = 1;
  int y = 1;

  public static void main(String[] args) throws Exception{
    CloneSuperOrd a = new CloneSuperOrd(12, 13); 
    a.c1 = new Ordinary(2, 3);

    CloneSuperOrd c = a.clone();
    System.out.println(a);
    System.out.println(c);
    System.out.println(a == c);
    System.out.println(a.c1 == c.c1);
  }

  public CloneSuperOrd(){
    super();
  }

  public CloneSuperOrd(int x, int y){
    this();
    this.x = x;
    this.y = y;
  }

  public CloneSuperOrd clone() throws CloneNotSupportedException{
    return (CloneSuperOrd)super.clone();
  }
  
   public String toString(){
     return "x=" + x + ",y=" + y + ",c1.x=" + c1.x + ",c1.y=" + c1.y;
   }
}

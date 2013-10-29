public class CloneSuperRec implements Cloneable{
  Clone1 c1;
  int x = 1;
  int y = 1;

  public static void main(String[] args) throws Exception{
    CloneSuperRec a = new CloneSuperRec(12, 13); 
    a.c1 = new Clone1(2, 3);

    CloneSuperRec c = a.clone();
    System.out.println(a);
    System.out.println(c);
    System.out.println(a == c);
    System.out.println(a.c1 == c.c1);
  }

  public CloneSuperRec(){
    super();
  }

  public CloneSuperRec(int x, int y){
    this();
    this.x = x;
    this.y = y;
  }

  public CloneSuperRec clone() throws CloneNotSupportedException{
    CloneSuperRec cs = (CloneSuperRec)super.clone();
    cs.c1 = this.c1.clone();
    return cs; 
  }
  
   public String toString(){
     return "x=" + x + ",y=" + y + ",c1.x=" + c1.x + ",c1.y=" + c1.y;
   }
}

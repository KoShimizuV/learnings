public class CloneSuper implements Cloneable{
  Clone1 c1;
  int x = 1;
  int y = 1;

  public static void main(String[] args) throws Exception{
    CloneSuper a = new CloneSuper(12, 13); 
    a.c1 = new Clone1(2, 3);

    CloneSuper c = a.clone();
    System.out.println(a);
    System.out.println(c);
    System.out.println(a == c);
    System.out.println(a.c1 == c.c1);
  }

  public CloneSuper(){
    super();
  }

  public CloneSuper(int x, int y){
    this();
    this.x = x;
    this.y = y;
  }

  public CloneSuper clone() throws CloneNotSupportedException{
    return (CloneSuper)super.clone();
  }
  
   public String toString(){
     return "x=" + x + ",y=" + y + ",c1.x=" + c1.x + ",c1.y=" + c1.y;
   }
}

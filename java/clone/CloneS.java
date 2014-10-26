public class CloneS implements Cloneable{
  int x = 1;
  String s = "a";

  public static void main(String[] args) throws Exception{
    CloneS a = new CloneS(2, "def"); 
    CloneS c = a.clone();
    System.out.println(a);
    System.out.println(c);
    System.out.println("object=" + (a == c));
    System.out.println("s=" + (a.s == c.s));
  }

  public CloneS(){
    super();
  }

  public CloneS(int x, String s){
    this();
    this.x = x;
    this.s = s;
  }

  public CloneS clone() throws CloneNotSupportedException{
    return (CloneS)super.clone();
  }
  
   public String toString(){
     return "x=" + x + ",s=" + s;
   }
}

public class Clone1 implements Cloneable{
  int x = 1;
  int y = 1;

  public static void main(String[] args) throws Exception{
    Clone1 a = new Clone1(2, 3); 
    Clone1 c = a.clone();
    System.out.println(a);
    System.out.println(c);
    System.out.println(a == c);
  }

  public Clone1(){
    super();
  }

  public Clone1(int x, int y){
    this();
    this.x = x;
    this.y = y;
  }

  public Clone1 clone() throws CloneNotSupportedException{
    return (Clone1)super.clone();
  }
  
   public String toString(){
     return "x=" + x + ",y=" + y;
   }
}

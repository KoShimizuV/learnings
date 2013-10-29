public class Ordinary{
  int x = 1;
  int y = 1;

  public static void main(String[] args) throws Exception{
    Ordinary a = new Ordinary(2, 3); 
    System.out.println(a);
  }

  public Ordinary(){
    super();
  }

  public Ordinary(int x, int y){
    this();
    this.x = x;
    this.y = y;
  }

   public String toString(){
     return "x=" + x + ",y=" + y;
   }
}

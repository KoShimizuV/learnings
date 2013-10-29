import java.util.List;
import java.util.ArrayList;

public class CopyByConst{
  public static void main(String[] args){
     List<String> list = new ArrayList<String>();
     list.add("s");
     List<String> listDist = new ArrayList<String>(list);

     System.out.println(listDist.get(0));
     System.out.println("objct=" + (listDist.get(0) == list.get(0)));
  }
}

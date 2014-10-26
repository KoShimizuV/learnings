import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class CopyTest{

  public static void main(String[] args){
    List<String> list = new ArrayList<String>();
    list.add("a");
    List<String> listDist = new ArrayList<String>();
    listDist.add("x");
    Collections.copy(listDist, list);
    System.out.println(listDist.get(0)); 
    System.out.println("object=" + (list.get(0) == listDist.get(0))); 
  }
}

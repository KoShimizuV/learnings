import java.util.List;
import java.util.ArrayList;

public class MainExe{

   public static void main(String[] args){
     StockCode s = new StockCode();
     List<StockCode> listS = new ArrayList<StockCode>();
     listS.add(s);

     BlogCode b = new BlogCode();
     List<BlogCode> listB = new ArrayList<BlogCode>();
     listB.add(b);

     System.out.println(listS.get(0).getCode());     
     System.out.println(listB.get(0).getCode());     

     CodeConverter.execute(listS);
     CodeConverter.execute(listB);

     System.out.println(listS.get(0).getCode());     
     System.out.println(listB.get(0).getCode());     
  }
}

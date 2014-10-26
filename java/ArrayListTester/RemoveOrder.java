import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Collections;

public class RemoveOrder {
    public static void main(String[] args){
        List<Integer> list = new ArrayList<Integer>();
        list.add(4);
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(5);
        Collections.sort(list);
        for(Integer i : list){
            System.out.println(i);
        }
        Iterator<Integer> itr = list.iterator();
        while(itr.hasNext()){
            Integer i = itr.next();
            if(i == 2){
                itr.remove();
            }
        }
        System.out.println("---");
        for(Integer i : list){
            System.out.println(i);
        }
    }

}

package maptest;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

public class Map2List{

    public static void main (String[] args) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("Name", "Tanaka");
        map.put("Name2", "Tanaka2");
        List<String> list = new ArrayList<String>(map.values());
        for(String s : list){
            System.out.println(s);
        }
        List<String> listKey = new ArrayList<String>(map.keySet());
        for(String s : listKey){
            System.out.println(s);
        }
    }
}

import java.util.Map;

public class Envi {
    public static void main(String[] args){
        Map<String, String> map = System.getenv();
        for(String key : map.keySet()){
            System.out.println(key+"="+map.get(key));
        }
        System.out.println(System.getenv("HOME"));
    }
}

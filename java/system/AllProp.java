import java.util.Properties;
import java.util.Set;

public class AllProp {
    public static void main(String[] args){
        Properties list = System.getProperties();
        Set<String> s = list.stringPropertyNames();
        for(String key : s){
            System.out.println(key +"="+ list.getProperty(key));
        }
    }
}

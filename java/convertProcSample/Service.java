import java.util.List;
import java.util.Arrays;

class Service{
    public static void main(String args[]){
        String[] arr = {"A","B"};
        List<String> list = Arrays.asList(arr);
        for(String s : list){
            ConvertLogic cl = ConvertLogic.getInstance(s);
            Entity e1 = cl.convert("commonvalue_1");
            Entity e2 = cl.convert2("commonvalue_2");
            System.out.println(e1);
            System.out.println(e2);
        }
    }
}

abstract class ConvertLogic{
    abstract void convertByLogic(Entity e);
    abstract void convert2ByLogic(Entity e);

    public static ConvertLogic getInstance(String s){
        if(s.equals("A")){
             return new ConvertLogicA();
        } else {
             return new ConvertLogicB();
        }
    }

    public Entity convert(String s){
        Entity e = new Entity();          
        e.s1 = s;
        convertByLogic(e);
        return e ;         
    }

    public Entity convert2(String s){
        Entity e = new Entity();          
        e.s1 = s;
        convert2ByLogic(e);
        return e ; 
    }
}

class ConvertLogicA extends ConvertLogic{
    @Override
    void convertByLogic(Entity e){
        e.s2 = "PaternA";
    }
    @Override
    void convert2ByLogic(Entity e){
        e.s2 = "PaternA";
    }
}

class ConvertLogicB extends ConvertLogic{
    @Override
    void convertByLogic(Entity e){
        e.s2 = "PaternB";
    }
    @Override
    void convert2ByLogic(Entity e){
        e = null;
    }
}

class Entity{
    String s1; // set common value
    String s2; // set value by logic
    public String toString (){
        return "s1=" + s1 + ",s2=" + s2;
    }
}

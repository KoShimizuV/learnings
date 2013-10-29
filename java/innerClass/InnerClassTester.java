public class InnerClassTester{
    public static void main(String[] args){
        
        ClassA a = new ClassA();
        
        ClassA.ClassIn1 c1 = new ClassA.ClassIn1();
        System.out.println(c1.getString());

        ClassA.ClassIn2 c2 = a.new ClassIn2();
        System.out.println(c2.getString());
    }
}


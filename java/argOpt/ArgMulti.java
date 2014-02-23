public class ArgMulti {
	public static void main(String[] args){
	    meth(1);	
	    meth(1,2);	
	    meth(1,2,3);	
	}
    public static void meth(int x, int y){
        System.out.println("fix=" + x + "," + y);
    }
    public static void meth(int ...x){
        System.out.print("chg=");
        for(int i : x){
            System.out.print(i + ",");
        }
        System.out.println("");
    }
}

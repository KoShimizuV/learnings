
public class StaticTester {
    public static int seqno;
    public static void main(String[] args) throws InterruptedException{
        for(int i=0; i<10; i++){
            String pid = System.getProperty("pid");
            System.out.println(id +","+ seqno++);
            Thread.sleep(500);
        }
    }
}

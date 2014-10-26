import java.io.*;

class Rename{

    public static void main(String[] args){

        System.out.println("---> start");

        if(args.length != 3 ) return;

        String bfrName = args[1];
        String aftName = args[2];

        System.out.println("bfrName : " + bfrName);
        System.out.println("aftName : " + aftName);

        File f = new File(args[0]);
        
        if(!f.isDirectory()) return;
        
        String[] cont = f.list();
        
        // replace start
        for(int i = 0; i < cont.length; i++){
        
            File f2 = new File(args[0], cont[i]);

            String orgName = f2.getName();
        
            System.out.println("orgName : " + orgName);
        
            String nwName = orgName.replaceAll(bfrName,aftName);

            System.out.println("nwName  : " + nwName);
        
            File f3 =  new File(f2.getParent() + "\\" + nwName);
            
            f2.renameTo(f3);
        
        }

       System.out.println("<--- end");
    
    }


}
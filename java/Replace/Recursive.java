import java.io.File;

public class Recursive{

    public static void main(String[] args){

//        String dirPath = "D:\\MyDocuments\\100_PC\\00_Programing\\Java\\10_SampleScript\\20_Javaまるごと学習ブック\\02_ディレクトリの扱い方\\10_再帰的なディレクトリ\\sample";
        String dirPath = args[0];
        
        File dir = new File(dirPath);

        if( args.length == 1 ){
            listPath(dir);
        }else if( args.length == 3 ){
            String bfrName = args[1];
            String aftName = args[2];
            replaceFileName(dir, bfrName, aftName);
        }

    }

    private static void listPath(File f){
        File[] infiles = f.listFiles();
        
        for(int i=0; i<infiles.length; i++){
            if(infiles[i].isDirectory()){
                listPath(infiles[i]);
            }else{
                String name = infiles[i].getAbsolutePath();
//                String name = infiles[i].getParent() + "\\" + infiles[i].getName();
                System.out.println(name);
            }
        }
    }


    private static void replaceFileName(File f, String bfrStr, String aftStr){
        File[] infiles = f.listFiles();
        
        for(int i=0; i<infiles.length; i++){
            if(infiles[i].isDirectory()){
                replaceFileName(infiles[i], bfrStr, aftStr);
            }else{
                String bfrName = infiles[i].getAbsolutePath();
                String aftName = bfrName.replaceAll(bfrStr, aftStr);

                File aftFile = new File(aftName);
                infiles[i].renameTo(aftFile);

                System.out.println(aftName);
            }
        }
    }
}


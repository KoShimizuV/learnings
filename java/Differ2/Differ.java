import java.io.File;
import java.util.TreeMap;
import java.util.Map;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import java.io.FileWriter;

public class Differ {

    static String dirPath1 = null; 
    static String dirPath2 = null; 
    public static void execute(String arg1, String arg2) {
//        dirPath1 = args[0];
//        dirPath2 = args[1];
        dirPath1 = arg1;
        dirPath2 = arg2;
        File dir1 = new File(dirPath1);
        File dir2 = new File(dirPath2);
        try{
            map = new TreeMap<String, String>();
            listPath(dir1, dirPath1);
            Map<String, String> mapA = new TreeMap<String, String>(map);

            map = new TreeMap<String, String>();
            listPath(dir2, dirPath2);
            Map<String, String> mapB = new TreeMap<String, String>(map);
            Set<String> keyUniq = new HashSet<String>(); 
 
            for(String key : mapA.keySet()){
                keyUniq.add(key); 
            }
            for(String key : mapB.keySet()){
                keyUniq.add(key); 
            }

            List<String> outLista = new ArrayList<String>();
            List<String> outListb = new ArrayList<String>();
            List<String> outListd = new ArrayList<String>();
            for(String key : keyUniq){
                String a = mapA.get(key);
                String b = mapB.get(key);
                if (a == null) {
                    outLista.add(key + ",Not in " + dir1 + ",,," + b);
                } else if ( b == null) {
                    outListb.add(key + ",Not in " + dir2 + "," + a);
                } else if (!a.equals(b)) {
                    outListd.add(key + ",diff," + a + "," + b);
                }
            }
            
            PrintWriter pw = new PrintWriter(new FileWriter("diff.csv"));
            pw.println("file,diff,a-modified,a-size,b-modified,b-size");
            for (String key : outLista){
                pw.println(key); 
            }
            for (String key : outListb){
                pw.println(key); 
            }
            for (String key : outListd){
                pw.println(key); 
            }
            pw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    static Map<String, String> map = null;
    static final SimpleDateFormat FMT_DATE_TIME = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S");

    private static void listPath(File f,String dirPath){
        File[] infiles = f.listFiles();
        for(int i=0; i<infiles.length; i++){
            if(infiles[i].isDirectory()){
                listPath(infiles[i], dirPath);
            }else{
                String name = infiles[i].getPath().replace('\\','/').replace(dirPath, "");
                map.put(name, FMT_DATE_TIME.format(new Date(infiles[i].lastModified())) + "," + infiles[i].length());
            }
        }
    }
}
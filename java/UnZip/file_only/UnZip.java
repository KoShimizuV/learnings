import java.util.zip.*;
import java.util.Enumeration;
import java.io.File;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

public class UnZip{

    public static void main(String[] args){
    
        String filePath = args[0];
    
        try{
        
            ZipFile zipFile = new ZipFile(filePath);
            
            Enumeration entries = zipFile.entries();
            
            while(entries.hasMoreElements()){
            
                // 解凍するファイル一覧を取得する
                ZipEntry zipEntry = (ZipEntry) entries.nextElement();
                
                File file = new File(zipEntry.getName());
            
                // 格納されているファイルを取り出す
                BufferedInputStream bis = new BufferedInputStream(zipFile.getInputStream(zipEntry));

                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
                
                int c;
                
                // データの読み出し
                while( ( c = bis.read()) != -1 ){
                    // データの書き込み
                    bos.write((byte)c);
                }
                
                bis.close();
                bos.close();
            }
        }catch(Exception e){

            e.printStackTrace();

        }
    }
}



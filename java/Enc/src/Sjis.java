import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;


public class Sjis {

	public static void main(String args[]) throws UnsupportedEncodingException{
		
		String in_line = "";
		String line = "";
		try{
			/*ファイルをオープンします。*/
			BufferedReader br = new BufferedReader(new FileReader("in.txt"));

			/*ファイルを読み込みます。*/
			while ((line = br.readLine()) != null) {
				in_line = line;
			}
			/*ファイルをクローズします。*/
			br.close();
		}catch(IOException e){
			  System.out.println(e + "例外が発生しました");
		}
		
		String out = new String(in_line.getBytes("UTF-8"), "Shift_JIS");
		
		try{
			  /* FileWriter クラスのインスタンスを作成します。*/
			  	FileWriter fw = new FileWriter("./out.txt");
			  /* ファイルに書き込みます。*/
			  	fw.write(out);
			  /*ファイルをクローズします。*/
				fw.close();
		  }catch(IOException e){
				System.out.println(e + "例外が発生しました");
		  }
	}
}

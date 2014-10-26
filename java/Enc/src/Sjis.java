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
			/*�t�@�C�����I�[�v�����܂��B*/
			BufferedReader br = new BufferedReader(new FileReader("in.txt"));

			/*�t�@�C����ǂݍ��݂܂��B*/
			while ((line = br.readLine()) != null) {
				in_line = line;
			}
			/*�t�@�C�����N���[�Y���܂��B*/
			br.close();
		}catch(IOException e){
			  System.out.println(e + "��O���������܂���");
		}
		
		String out = new String(in_line.getBytes("UTF-8"), "Shift_JIS");
		
		try{
			  /* FileWriter �N���X�̃C���X�^���X���쐬���܂��B*/
			  	FileWriter fw = new FileWriter("./out.txt");
			  /* �t�@�C���ɏ������݂܂��B*/
			  	fw.write(out);
			  /*�t�@�C�����N���[�Y���܂��B*/
				fw.close();
		  }catch(IOException e){
				System.out.println(e + "��O���������܂���");
		  }
	}
}

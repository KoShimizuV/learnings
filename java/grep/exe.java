package grep;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class exe {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("grep.txt"));
		String line = "";
		String content = "";
		while ((line = br.readLine()) != null) {
			content += line + "\n";
		}
		System.out.println(content);
		
		
		
	}
}

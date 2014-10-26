package url;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class GetWeb {

	public static void main(String[] args) throws Exception {

		URL url = new URL("http://www.translink.co.jp/company/settlement_schedule.html");
		URLConnection con = url.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "Shift_JIS"));
		String line = "";
		while ((line = br.readLine()) != null) {
			System.out.println(line);
		}
	}
}

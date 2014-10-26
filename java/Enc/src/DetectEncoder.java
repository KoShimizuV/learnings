import java.io.UnsupportedEncodingException;

public class DetectEncoder {
	
	// http://d.hatena.ne.jp/cero-t/20100204/1265302329
	public static void main(String args[]) {
		String test = "あ";
		System.out.println(detectEncoding(test));
		
	}

	private static boolean checkCharacterCode(String str, String encoding) {
		if (str == null) {
			return true;
		}

		try {
			byte[] bytes = str.getBytes(encoding);
			return str.equals(new String(bytes, encoding));
		} catch (UnsupportedEncodingException ex) {
			throw new RuntimeException("エンコード名称が正しくありません。", ex);
		}
	}
	
	public static String detectEncoding (String str) {
		String rs = "";
		if (isWindows31j(str)) {
			rs = "Windows-31j";
		} else if (isSJIS(str)) {
			rs = "SJIS";
		} else if (isEUC(str)) {
			rs = "euc-jp";
		} else if (isUTF8(str)) {
			rs = "UTF-8";
		}
		return rs;
	}

	public static boolean isWindows31j(String str) {
		return checkCharacterCode(str, "Windows-31j");
	}

	public static boolean isSJIS(String str) {
		return checkCharacterCode(str, "SJIS");
	}

	public static boolean isEUC(String str) {
		return checkCharacterCode(str, "euc-jp");
	}

	public static boolean isUTF8(String str) {
		return checkCharacterCode(str, "UTF-8");
	}

}

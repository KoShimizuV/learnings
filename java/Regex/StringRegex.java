package Regex;

public class StringRegex {
	public static void main(String[] args){
		
		// ref http://java.sun.com/javase/ja/6/docs/ja/api/java/lang/String.html#matches(java.lang.String)
		
		String content = "abc";
		boolean ret = content.matches("^a.*");
		System.out.println(ret);
	}

}

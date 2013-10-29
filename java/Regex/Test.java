package Regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {

	public static void main (String[] args) {
    	String regex = "(201[0-9]{1,}/[0-9]{1,2}/[0-9]{1,2})"; 
    	Pattern p = Pattern.compile(regex);
    	String content = "2010/12/10";
    	content += "\n2010/12/11";
//	    	String content = "aaa";
    	Matcher m = p.matcher(content);
    	
		int i = 0;
    	while(m.find()){
    		System.out.println(m.group(i));
    		i++;
    	}
	}
}

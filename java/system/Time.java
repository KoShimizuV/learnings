package system;

import java.util.Calendar;

public class Time {
	public static void main(String[] args){
		System.out.println(System.currentTimeMillis());
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		int H = cal.get(Calendar.HOUR_OF_DAY);
		int i = cal.get(Calendar.MINUTE);
		System.out.println(y + "/" + m + "/" + d + " " + H + ":" + i);
	}
}

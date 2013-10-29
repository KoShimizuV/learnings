package timezone;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public class TimeZoneTester {
	
	public static final SimpleDateFormat FMT_DATE = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public static void main(String[] args) throws IOException {
		two();
	}

	public static void one() throws IOException{
		PrintWriter p = new PrintWriter(new BufferedWriter(new FileWriter("tmp.txt")));
		for (String id : TimeZone.getAvailableIDs()) {
			TimeZone tz = TimeZone.getTimeZone(id);
			Calendar cal = new GregorianCalendar(tz);
			cal.clear();
			cal.set(2006, 0, 1, 0 ,0);
			cal.setTimeInMillis( cal.getTimeInMillis() -9*60*60*1000 + tz.getRawOffset());
			
			boolean pre = false;
			for (int i=1; i<365*10*24; i++ ) {
				cal.add(Calendar.HOUR, 1);
				if (tz.inDaylightTime(cal.getTime()) != pre) {
					p.println(id + "," + FMT_DATE.format(cal.getTimeInMillis() - 9*60*60*1000 + tz.getRawOffset())  + "," +  tz.inDaylightTime(cal.getTime()) + "," + (double)tz.getRawOffset()/60/60/1000);
				}
				pre = tz.inDaylightTime(cal.getTime());
			}
		}
		p.flush();
		p.close();
		System.out.println("finish");
		
	}
	
	public static void two() throws IOException{
		System.out.println("init");
		PrintWriter p = new PrintWriter(new BufferedWriter(new FileWriter("tmp.txt")));
		for (String id : TimeZone.getAvailableIDs()) {
			TimeZone tz = TimeZone.getTimeZone(id);
			Calendar cal = new GregorianCalendar(2006, 0, 1, 0 ,0);
			
			boolean pre = false;
			for (int i=1; i<365*10*24; i++ ) {
				cal.add(Calendar.HOUR, 1);
				if (tz.inDaylightTime(cal.getTime()) != pre) {
					p.println(id + "," + FMT_DATE.format(cal.getTimeInMillis() - 9*60*60*1000 + tz.getRawOffset())  + "," +  tz.inDaylightTime(cal.getTime()) + "," + (double)tz.getRawOffset()/60/60/1000);
				}
				pre = tz.inDaylightTime(cal.getTime());
			}
		}
		p.flush();
		p.close();
		System.out.println("finish");
	}
}

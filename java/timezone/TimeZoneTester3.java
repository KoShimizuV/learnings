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

public class TimeZoneTester3 {
	
	public static final SimpleDateFormat FMT_DATE = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public static void main(String[] args) throws IOException {
		new TimeZoneTester3().two();
	}
	
	private void one(){
		for (String id : TimeZone.getAvailableIDs()) {
			TimeZone tz = TimeZone.getTimeZone(id);
			Calendar cal = new GregorianCalendar(tz);
			cal.clear();
			cal.set(2006, 0, 1, 0 ,0);
			System.out.println(id + "," + FMT_DATE.format(cal.getTimeInMillis() - 9*60*60*1000 + tz.getRawOffset()) + "," + (double)tz.getRawOffset()/60/60/1000);
		}
	}

	private void two(){
		for (String id : TimeZone.getAvailableIDs()) {
			TimeZone tz = TimeZone.getTimeZone(id);
			Calendar cal = new GregorianCalendar(2006, 0, 1, 0 ,0);
			System.out.println(id + "," + FMT_DATE.format(cal.getTimeInMillis()) + "," + (double)tz.getRawOffset()/60/60/1000);
		}
		
	}

}

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

public class TimeZoneTester2 {
	
	public static final SimpleDateFormat FMT_DATE = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public static void main(String[] args) throws IOException {

		for (String id : TimeZone.getAvailableIDs()) {
			TimeZone tz = TimeZone.getTimeZone(id);
			Calendar cal = new GregorianCalendar(tz);
			cal.clear();
			cal.set(2006, 0, 1, 0 ,0);
			System.out.println(id + "," + FMT_DATE.format(cal.getTime()));
		}
System.out.println("---");
		for (String id : TimeZone.getAvailableIDs()) {
			TimeZone tz = TimeZone.getTimeZone(id);
			Calendar cal = new GregorianCalendar(2006, 0, 1, 0 ,0);
			cal.setTimeZone(tz);
			System.out.println(id + "," + FMT_DATE.format(cal.getTime()));
		}

	}

}

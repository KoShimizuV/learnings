package Set;

import java.util.HashSet;
import java.util.Iterator;

public class SetTest {

	public static void main (String[] args) {
		HashSet<String> set = new HashSet<String>();
		set.add("test");
		set.add("test");
		
		Iterator<String> itr = set.iterator();
		while(itr.hasNext()){
			System.out.println(itr.next());
		}
	}
}

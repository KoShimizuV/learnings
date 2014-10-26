package compara;

import java.util.Map;
import java.util.TreeMap;
import java.util.Comparator;

public class ComparatorTester {

	public static void main(String[] args) {
		MyComparator c = new MyComparator();
		Map<String, Integer> map = new TreeMap<String, Integer>(c);
		map.put("bbb",3);
		map.put("aa",5);
		map.put("c",4);
		
		for (String key : map.keySet()) {
			System.out.println(key + "=" + map.get(key));
		}
		
	}
}

class MyComparator implements Comparator<String> {

	@Override
	public int compare(String o1, String o2) {
		return o1.length() - o2.length();
	}

}
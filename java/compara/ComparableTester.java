package compara;

import java.util.Map;
import java.util.TreeMap;

public class ComparableTester {

	public static void main(String[] args) {
		Map<SampleBean, Integer> map = new TreeMap<SampleBean, Integer>();
		SampleBean bean1 = new SampleBean();
		bean1.setId(1);
		SampleBean bean2 = new SampleBean();
		bean2.setId(2);
		SampleBean bean3 = new SampleBean();
		bean3.setId(0);

		map.put(bean2, 20);
		map.put(bean3, 50);
		map.put(bean1, 10);
		
		for (SampleBean key : map.keySet()) {
			System.out.println(key.getId() + "=" + map.get(key));
		}
		
	}
}

class SampleBean implements Comparable<SampleBean> {
	private int id ;
	private String val ;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	/** 
	 * ©•ª©g‚ª¬‚³‚¢ -1
	 * ©•ª©g‚Æ“™‚µ‚¢  0
	 * ©•ª©g‚ª‘å‚«‚¢ +1
	 */
	@Override
	public int compareTo(SampleBean bean) {
		return id - bean.getId();
	}

}
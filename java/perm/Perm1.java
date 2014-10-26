import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

public class Perm1 {

  // 1,2,3
  // 1-2-3
  // 1-3-2
  // 2-1-3
  // 2-3-1
  // 3-1-2
  // 3-2-1

  public static void main(String[] args){
    List<Integer> list = new ArrayList<Integer>();
    list.add(1);
    list.add(2);
    list.add(3);
    for(int n : list){
      create(n, list);
    }  
  }

  static void create(int base, List<Integer> nums){
    List nList = new ArrayList<
    System.out.println(base);
    int index = Collections.binarySearch(nums, base);
    if(0 <= index){
      nums.remove(index);
    }
    for(int n : nums){
      create(n, nums);
    }
  }

}

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

public class Game{

  public static void main(String[] args) throws Exception{
    FloorMap m = FloorMap.getInstance("map.txt");
    Player p1 = Player.getInstance(m);
    List<Player> list = new ArrayList<Player>();
    list.add(p1);

    List<Player> goalList = new ArrayList<Player>();
    for(int i=0; i < list.size()  && i < 1000; i++){
      Player p = list.get(i);
      System.out.println("i=" + i);
      for(int j=0; p.hasMovable() && j < 1000; j++){
        List<Player> cloneP = p.getClonePlayers();
        System.out.println("j=" + j + ",c size="+ cloneP.size());
        for(Player clone : cloneP){
          System.out.println("j=" + j + ",c="+ clone);
          list.add(clone);
        }
        p.move();
        if(p.isGoal()){
           System.out.println("goal");
           goalList.add(p);
           break;
        }
      } 
      System.out.println("is end. p=" + p);
    } 
    for(Player p : goalList){
      System.out.println(p);
    }

  }
}

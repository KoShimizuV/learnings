import java.util.List;
import java.util.ArrayList;

public class Player implements Cloneable{
  private FloorMap floorMap;
  private Cell currentCell;
  private int moveN = 0;

  private Player(){
    super();
  }

  public Player getInstance(Cell c) throws CloneNotSupportedException {
    Player p = clone();
    p.currentCell = c;
    c.onFoot();
    p.moveN++;
    return p;
  }

  public static Player getInstance(FloorMap m){
    Player p = new Player(); 
    p.floorMap = m;
    p.currentCell = m.getStartCell();
    return p;
  }

  public void move(){
    Cell next = getMoveNext(); 
    next.onFoot();
    currentCell = next;
    moveN++;
  }

  public Cell getMoveNext(){
    return getMovableCell().get(0);
  }

  public List<Player> getClonePlayers() throws CloneNotSupportedException{
    List<Player> list = new ArrayList<Player>();
    for(Cell c : getMovableCell()){
      if(c == getMoveNext()){
          continue;
       }
       list.add(getClone(c)); 
    }
    return list;
  }
  
  public Player getClone(Cell c) throws CloneNotSupportedException{
    return getInstance(c); 
  }

  public List<Cell> getMovableCell(){
     return floorMap.getMovableCell(currentCell);
  }

  public boolean hasMultipleCell(){
     return getMovableCell().size() > 1;
  }

  public boolean hasMovable(){
     return getMovableCell().size() > 0;
  }

  public boolean isGoal(){
    return currentCell.isGoal();
  }

  public Player clone() throws CloneNotSupportedException{
    Player p = (Player)super.clone();
    p.currentCell = currentCell.clone();
    p.floorMap = floorMap.clone();
    return p;
  }

  public String toString(){
    return "moveN=" + moveN + ",currentCell=" + currentCell;
  }
}

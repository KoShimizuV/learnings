import java.util.ArrayList;
import java.util.List;

import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

public class FloorMap implements Cloneable{

  List<Cell> list;

  private FloorMap(){
    super();
  }

  public static FloorMap getInstance(String path) throws Exception{
    FloorMap map = new FloorMap();
    map.list = load(path); 
    return map;
  } 

  public static List<Cell> load(String path) throws IOException{
    List<Cell> list = new ArrayList<Cell>();
    BufferedReader br = new BufferedReader(new FileReader(path));
    String line = "";
    for(int i=0; (line = br.readLine()) != null; i++){
      char[] cArr = line.toCharArray();
      int j=0;
      for(char c : cArr){
        Cell cell = new Cell();
        cell.setPosX(i);
        cell.setPosY(j);
        cell.setKind(c);
        if(cell.isStart()){
          cell.onFoot(); 
        }
        list.add(cell);
        j++;
      }
    }
    return list;
  }

  public List<Cell> getMovableCell(Cell cell){
    List<Cell> outlist = new ArrayList<Cell>();
    for(Cell c : list){
      if(c.isNext(cell)){
        outlist.add(c);
      }
    }
    return outlist; 
  }

  public Cell getStartCell(){
     for(Cell c : list){
       if(c.isStart()){
         return c;
       }
     }
     return new Cell();
  }

  public FloorMap clone() throws CloneNotSupportedException{
    FloorMap m = (FloorMap)super.clone();
    for(Cell c : m.list){
      c = c.clone();
    }
    return m;
  }

}

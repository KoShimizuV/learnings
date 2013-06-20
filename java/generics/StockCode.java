public class StockCode implements CodeInterface{
  String code = "111";
  String name;
  java.util.Date listingStart;

  public void setCode(String s){
    this.code = s;
  } 

  public String getCode(){
    return this.code;
  }
}

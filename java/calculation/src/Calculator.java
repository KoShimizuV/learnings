import java.util.List;

public Calculator {
   CalcMethod cm;
   List<Income> incomeList;

    public Calculator getInstance(CalcMethod cm, List<income> list){
        Calculator ca = new Calculator();
        ca.cm = cm;
        ca.incomeList = list;
        return ca;
    }

    private Calculator () {
        return super();
    }
    public getDiff(){
        cm.getDiff();
    } 
  
}

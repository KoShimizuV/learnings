package bean;

import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.Date;
import java.util.Comparator;
import java.util.Collections;

public class Income{

    String code;
    String fterm;
    Date date; // dlvymd
    String ctype; // 3:ifrs, 2:jp, 1:sec
    String accMethod; // con, par
    String announcer; // quick, company, ifis, actual
    int price;

    public static final String CTYPE_IFRS = "3";
    public static final String CTYPE_JP = "2";
    public static final String CTYPE_SEC = "1";

    public static final String ANN_ACT = "actual";
    public static final String ANN_QUICK = "quick";
    public static final String ANN_COMP = "company";

    static List<String> ctypePriority = new LinkedList<String>();
    static List<String> accMethodPriority = new LinkedList<String>();
    static {
        accMethodPriority.add("con");
        accMethodPriority.add("par");

        ctypePriority.add(CTYPE_IFRS);
        ctypePriority.add(CTYPE_JP);
        ctypePriority.add(CTYPE_SEC);
    }

    public static List<String> getCtypePriority(String ctype){
        LinkedList<String> list = new LinkedList<String>(Income.ctypePriority);
        if(ctype != null){
            list.addFirst(ctype);
        } 
        return list;
    }

    public static void sortAccMethod(List<Income> list){
        Collections.sort(list, new Income.AccMethodComparator());
    }

    public static void sortCtype(List<Income> list){
        Collections.sort(list, new Income.CtypeComparator());
    }

    public static void sortDateR(List<Income> list){
        Collections.sort(list, new Income.DateRComparator());
    }

    public static void sortDate(List<Income> list){
        Collections.sort(list, new Income.DateComparator());
    }

    public static void sort(List<Income> list){
        Income.sortDate(list);
        Income.sortCtype(list);
    }

    private static List<Income> extractByDateAfter(List<Income> list, Date date){
        List<Income> outList = new ArrayList<Income>();
        for(Income b : list){
            if(b.date.getTime() >= date.getTime()){
                outList.add(b);
            }
        }
        return outList;
    }

    private static List<Income> extractByDateBefore(List<Income> list, Date date){
        List<Income> outList = new ArrayList<Income>();
        for(Income b : list){
            if(b.date.before(date)){
                outList.add(b);
            }
        }
        return outList;
    }

    private static List<Income> extractByCtype(List<Income> list, String ctype){
        List<Income> outList = new ArrayList<Income>();
        for(Income b : list){
            if(b.ctype.equals(ctype)){
                outList.add(b);
            }
        }
        return outList;
    }

    private static List<Income> extractByAccMethod(List<Income> list, String accMethod){
        List<Income> outList = new ArrayList<Income>();
        for(Income b : list){
            if(b.accMethod.equals(accMethod)){
                outList.add(b);
            }
        }
        return outList;
    }

    public static Income getIncomeBeforeAnn(List<Income> list, String fterm, String announcer, Date annDate){
        List<Income> listBfr = extractByDateBefore(list, annDate);
        Income.sortDateR(listBfr);
        return getIncome(listBfr, fterm, announcer);
    }

    public static Income getIncomeAfterAnn(List<Income> list, String fterm, String announcer, Date annDate){
        List<Income> listAft = extractByDateAfter(list ,annDate);
        Income.sortDate(listAft);
        return getIncome(listAft, fterm, announcer);
    }

    private static Income getIncome(List<Income> list, String fterm, String announcer){
        return Income.getIncome(list, fterm, announcer, getActualCtype(list, fterm));
    }

    private static Income getIncome(List<Income> list, String fterm, String announcer, String ctypeP){
         for(String accM : accMethodPriority){
            List<Income> accMlist = extractByAccMethod(list, accM);
            for(String ctype : getCtypePriority(ctypeP)) {
                List<Income> ctypeList = extractByCtype(accMlist, ctype);
                for(Income b : ctypeList){
                    if(b.fterm.equals(fterm) && b.announcer.equals(announcer)){
                        return b;
                    }
                }
            }
        }
        return new Income();
   }

    public static String getActualCtype(List<Income> list, String fterm){
        Income b = getIncome(list, fterm, Income.ANN_ACT, null);
        return b.ctype != null ? b.ctype : Income.CTYPE_IFRS;
    }

    /**
     * 
     *  @return Map<String, String> : Map<fterm, ctype>
     */
    public static Map<String, String> getActualCtypeFtermMap(List<Income> list){
        Map<String, String> map = new HashMap<String, String>();
        Set<String> ftermS = new HashSet<String>();
        for(Income b : list){
            ftermS.add(b.fterm);
        }
        Map<String, String> actMap = new HashMap<String, String>();
        for(String fterm : ftermS){
            Income b = getIncome(list, fterm, Income.ANN_ACT);
            if(!actMap.containsKey(b.fterm)){
                actMap.put(b.fterm, b.ctype);
            }
        }
        return actMap;
    }

    public static class AccMethodComparator implements Comparator<Income>{
        @Override
        public int compare(Income o1, Income o2){
            return o1.accMethod.compareTo(o2.accMethod); 
        }
    }

    public static class CtypeComparator implements Comparator<Income>{
        @Override
        public int compare(Income o1, Income o2){
            return -1 * o1.ctype.compareTo(o2.ctype); 
        }
    }

    public static class DateRComparator implements Comparator<Income>{
        @Override
        public int compare(Income o1, Income o2){
            return -1 * o1.date.compareTo(o2.date); 
        }
    }

    public static class DateComparator implements Comparator<Income>{
        @Override
        public int compare(Income o1, Income o2){
            return o1.date.compareTo(o2.date); 
        }
    }

    public String getCode(){ return code; };
    public String getFterm(){ return fterm; };
    public Date getDate(){ return date; };
    public String getCtype(){ return ctype; }
    public String getAccMethod(){ return accMethod; }
    public String getAnnouncer(){ return announcer; }
    public int getPrice(){ return price; };

    public void setCode(String s){ code = s; };
    public void setFterm(String s){ fterm = s; };
    public void setDate(Date d){ date = d; };
    public void setCtype(String s){ ctype = s; }
    public void setAccMethod(String s){ accMethod = s; }
    public void setAnnouncer(String s){ announcer = s; }
    public void setPrice(int i){ price = i ; };

    public String toString(){
        return "code="+code+",fterm="+fterm+",date="+date+",ctype="+ctype+",accMethod="+accMethod+",announcer="+announcer+",price="+price;
    }

}

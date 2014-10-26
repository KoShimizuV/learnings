package test;

import bean.Income;
import junit.framework.TestCase;
import junit.framework.Test;
import junit.framework.TestSuite;
import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.LinkedList;
import java.util.ArrayList;
import java.text.SimpleDateFormat;

public class IncomeTester extends TestCase{

    private static SimpleDateFormat YMD = new SimpleDateFormat("yyyyMMdd");

    public static Test suite(){
        TestSuite suite = new TestSuite(IncomeTester.class);
       // TestSuite suite = new TestSuite();
       // suite.addTest(new IncomeTester("testGetIncomeBeforeAnnDate"));
        
        return suite;
    }

    public IncomeTester(String testname){
        super(testname);
    }
/*
    public void testFilterAccMethod1() throws Exception{
        List<Income> list = new ArrayList<Income>();
        Income.filterAccMethod(list, "con");
    }

    public void testFilterAccMethod() throws Exception{
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201311", Income.CTYPE_IFRS, "par", Income.ANN_ACT, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "par", Income.ANN_ACT, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_ACT, 20130102));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_ACT, 20130103));
        Income.filterAccMethod(list, "con");
        assertEquals(2, list.size());
        assertEquals("con", list.get(0).getAccMethod());
        assertEquals("con", list.get(1).getAccMethod());
    }
*/
    public void testGetActualCtypeFtermMap() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201311", Income.CTYPE_IFRS, "par", Income.ANN_ACT, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "par", Income.ANN_ACT, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_ACT, 20130102));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_ACT, 20130103));
        Map<String, String> map = Income.getActualCtypeFtermMap(list);
        assertEquals(Income.CTYPE_IFRS, map.get("201312"));
        assertEquals(Income.CTYPE_IFRS, map.get("201311"));
    }

    public void testGetCtypeP() throws Exception{
        List<String> list = Income.getCtypePriority(Income.CTYPE_JP);
        assertEquals(Income.CTYPE_JP, list.get(0));
        assertEquals(Income.CTYPE_IFRS, list.get(1));
        assertEquals(Income.CTYPE_JP, list.get(2));
        assertEquals(Income.CTYPE_SEC, list.get(3));
    }

    public void testSortC() throws Exception{
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "par", Income.ANN_QUICK, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130103));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_QUICK, 20130102));
        Income.sortCtype(list);
        assertEquals(Income.CTYPE_IFRS, list.get(0).getCtype());
    }

    public void testSortAccM() throws Exception{
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "par", Income.ANN_QUICK, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130103));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_QUICK, 20130102));
        Income.sortAccMethod(list);
        assertEquals("con", list.get(0).getAccMethod());
        assertEquals("con", list.get(1).getAccMethod());
        assertEquals("par", list.get(2).getAccMethod());
    }

    public void testSort() throws Exception{
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130103));
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "par", Income.ANN_QUICK, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_QUICK, 20130102));
        Income.sort(list);
        assertEquals(Income.CTYPE_IFRS, list.get(0).getCtype());
        assertEquals(s2d(20130103), list.get(0).getDate());
        assertEquals(Income.CTYPE_JP, list.get(1).getCtype());
    }

    public void testGetIncomeBeforeParC() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_COMP, 20130201));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_COMP, 20130129));
        Income bean = Income.getIncomeBeforeAnn(list, "201312", Income.ANN_COMP, s2d(20130204));
        assertEquals(s2d(20130129), bean.getDate());
        assertEquals("con", bean.getAccMethod());
    }

    public void testGetIncomeBeforePar() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_COMP, 20130201));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130203));
        Income bean = Income.getIncomeBeforeAnn(list, "201312", Income.ANN_COMP, s2d(20130204));
        assertEquals(s2d(20130201), bean.getDate());
        assertEquals("par", bean.getAccMethod());
    }

    public void testGetIncomeBeforeAnnDateParCon() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130201));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130206));
        Income bean = Income.getIncomeBeforeAnn(list, "201312", Income.ANN_QUICK, s2d(20130204));
        assertEquals(s2d(20130203), bean.getDate());
        assertEquals("con", bean.getAccMethod());
    }

    public void testGetIncomeBeforeAnnDate() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130201));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130206));
        Income bean = Income.getIncomeBeforeAnn(list, "201312", Income.ANN_QUICK, s2d(20130204));
        assertEquals(s2d(20130203), bean.getDate());
    }

    public void testGetIncomeBeforeAnnParCon() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "par", Income.ANN_QUICK, 20130203));
        Income bean = Income.getIncomeBeforeAnn(list, "201312", Income.ANN_QUICK, s2d(20130204));
        assertEquals(Income.CTYPE_SEC, bean.getCtype());
    }

    public void testGetIncomeBeforeAnnCtype() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_QUICK, 20130203));
        Income bean = Income.getIncomeBeforeAnn(list, "201312", Income.ANN_QUICK, s2d(20130204));
        assertEquals(Income.CTYPE_IFRS, bean.getCtype());
    }

    public void testGetIncomeAfterAnnCtype() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_QUICK, 20130203));
        Income bean = Income.getIncomeAfterAnn(list, "201312", Income.ANN_QUICK, s2d(20130201));
        assertEquals(Income.CTYPE_IFRS, bean.getCtype());
    }

    public void testGetIncomeAfterAnnParCon() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130202));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "par", Income.ANN_QUICK, 20130203));
        Income bean = Income.getIncomeAfterAnn(list, "201312", Income.ANN_QUICK, s2d(20130201));
        assertEquals(Income.CTYPE_IFRS, bean.getCtype());
    }

    public void testGetIncomeAfterAnn() throws Exception {
        List<Income> list = new ArrayList<Income>();
        list.add(getIncomeB("201312", Income.CTYPE_IFRS, "con", Income.ANN_QUICK, 20130203));
        list.add(getIncomeB("201312", Income.CTYPE_SEC, "par", Income.ANN_QUICK, 20130101));
        list.add(getIncomeB("201312", Income.CTYPE_JP, "con", Income.ANN_QUICK, 20130102));
        Income bean = Income.getIncomeAfterAnn(list, "201312", Income.ANN_QUICK, s2d(20130201));
        assertEquals(Income.CTYPE_IFRS, bean.getCtype());
    }

    private Date s2d(int ymd) throws Exception{
        return YMD.parse(String.valueOf(ymd));
    }

    private Income getIncomeB(String fterm, String ctype, String accMethod, String announcer, int date) throws Exception{
        Income bean = new Income();
        bean.setFterm(fterm);
        bean.setCtype(ctype);
        bean.setAccMethod(accMethod);
        bean.setAnnouncer(announcer);
        bean.setDate(s2d(date));
        return bean;
    }
}

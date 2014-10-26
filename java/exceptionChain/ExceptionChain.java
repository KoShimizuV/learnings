class ExceptionChain {

  public static void main(String[] args) throws Exception{
    try{
       String a = null;
       a.trim();
    } catch (NullPointerException nullEx) {
       Exception e = new Exception("完了処理メッセージ構築失敗");
       e.initCause(nullEx); 
       throw e;
    }
  }


}

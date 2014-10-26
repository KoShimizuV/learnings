class StaticThrow {
    static {
        try{
            initialize();     
        } catch(Exception e){
            RuntimeException re = new RuntimeException("initialize error");
            re.initCause(e);
            throw re;
        }
    }

    public static void main(String[] args){
        System.out.println("this code does not executed");
    }

    private static void initialize() throws Exception{
        // some code here
        throw new Exception();
    }
}


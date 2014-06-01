class InitThrow {
    {
        try{
            initialize();     
        } catch(Exception e){
            RuntimeException re = new RuntimeException("initialize error");
            re.initCause(e);
            throw re;
        }

    }

    public static void main(String[] args){
        System.out.println("this is executed");
        new InitThrow();
    }

    private static void initialize() throws Exception{
        // some code here
        throw new Exception();
    }
}


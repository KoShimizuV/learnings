import java.awt.GraphicsEnvironment;

public class FontList {

    public static void main(String[] args){
        final String fontFamilyNames[] = GraphicsEnvironment.getLocalGraphicsEnvironment().getAvailableFontFamilyNames();
        for(String s : fontFamilyNames){
            System.out.println(s);
        } 
    }
}

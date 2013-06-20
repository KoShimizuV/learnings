import java.util.List;

public class CodeConverter{
  public static void execute(List<? extends CodeInterface> list){
    for(CodeInterface bean : list){
      bean.setCode(bean.getCode() + ".T");
    }
  }
}

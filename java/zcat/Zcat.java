import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.zip.GZIPInputStream;

/** 
 * http://www.atmarkit.co.jp/ait/articles/0710/24/news119_2.html
 * gzipファイルを読み込むサンプル 
 */
public class Zcat {
    public static void main(final String[] args) 
    throws IOException {
        try {
            final File file = new File("gzipsample.gz");
            System.out.println("gzipファイル読込: 開始: " +
                file.getAbsolutePath());
            new Zcat().process(file);
            System.out.println("gzipファイル読込: 終了");
        } catch (IOException e) {
            System.out.println("gzipファイル読込中に"+
                "例外が発生しました。処理中断します:" + 
                 e.toString());
        }
    }
    /**
     * gzipファイルを読み込みます
     * 
     * @param file 入力するgzipファイル
     * @throws IOException 入出力例外が発生した場合
     */
    public void process(final File file) throws IOException {
        final GZIPInputStream gzipInStream = new GZIPInputStream(
            new BufferedInputStream(new FileInputStream(file)));
        try {
            /* ファイルデータの読み込み。 */
            final ByteArrayOutputStream outStream 
                = new ByteArrayOutputStream();
            for (;;) {
                int iRead = gzipInStream.read();
                if (iRead < 0) break;
                outStream.write(iRead);
            }
            outStream.flush();
            outStream.close();
            System.out.println(" 内容: ["
                + new String(outStream.toByteArray()) + "]");
        } finally {
            gzipInStream.close();
        }
    }
}

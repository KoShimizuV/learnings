import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.zip.GZIPInputStream;

/** 
 * http://www.atmarkit.co.jp/ait/articles/0710/24/news119_2.html
 * gzip�t�@�C����ǂݍ��ރT���v�� 
 */
public class Zcat {
    public static void main(final String[] args) 
    throws IOException {
        try {
            final File file = new File("gzipsample.gz");
            System.out.println("gzip�t�@�C���Ǎ�: �J�n: " +
                file.getAbsolutePath());
            new Zcat().process(file);
            System.out.println("gzip�t�@�C���Ǎ�: �I��");
        } catch (IOException e) {
            System.out.println("gzip�t�@�C���Ǎ�����"+
                "��O���������܂����B�������f���܂�:" + 
                 e.toString());
        }
    }
    /**
     * gzip�t�@�C����ǂݍ��݂܂�
     * 
     * @param file ���͂���gzip�t�@�C��
     * @throws IOException ���o�͗�O�����������ꍇ
     */
    public void process(final File file) throws IOException {
        final GZIPInputStream gzipInStream = new GZIPInputStream(
            new BufferedInputStream(new FileInputStream(file)));
        try {
            /* �t�@�C���f�[�^�̓ǂݍ��݁B */
            final ByteArrayOutputStream outStream 
                = new ByteArrayOutputStream();
            for (;;) {
                int iRead = gzipInStream.read();
                if (iRead < 0) break;
                outStream.write(iRead);
            }
            outStream.flush();
            outStream.close();
            System.out.println(" ���e: ["
                + new String(outStream.toByteArray()) + "]");
        } finally {
            gzipInStream.close();
        }
    }
}
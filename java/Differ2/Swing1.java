import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JLabel;
import java.awt.Container;
import java.awt.BorderLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

class Swing1 extends JFrame implements ActionListener{

  JTextField text1;
  JTextField text2;
  JLabel label;

  public static void main(String args[]){
    Swing1 frame = new Swing1("FileDifference");
    frame.setVisible(true);
  }

  Swing1(String title){
    setTitle(title);
    setBounds(100, 100, 300, 250);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    JPanel p = new JPanel();

    text1 = new JTextField("C:/windarg_bk_20111229", 20);
    text2 = new JTextField("D:/My Dropbox/windarc", 20);
    JButton button = new JButton("execute");
    button.addActionListener(this);
    label = new JLabel();

    p.add(text1);
    p.add(text2);
    p.add(button);

    Container contentPane = getContentPane();
    contentPane.add(p, BorderLayout.CENTER);
    contentPane.add(label, BorderLayout.SOUTH);
  }

  public void actionPerformed(ActionEvent e){
    
    Differ.execute(text1.getText(), text2.getText());
    label.setText("finish");
    
  }
}

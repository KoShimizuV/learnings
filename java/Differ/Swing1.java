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
    Swing1 frame = new Swing1("ƒ^ƒCƒgƒ‹");
    frame.setVisible(true);
  }

  Swing1(String title){
    setTitle(title);
    setBounds(100, 100, 300, 250);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    JPanel p = new JPanel();

    text1 = new JTextField("a", 20);
    text2 = new JTextField("b", 20);
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
//    label.setText();
    
  }
}
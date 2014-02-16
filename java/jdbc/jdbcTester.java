package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcTester {

	public static void main(String args[]) throws SQLException, ClassNotFoundException {

		// Oracle JDBC Driverのロード
		Class.forName("com.mysql.jdbc.Driver");
		// Oracle8iに接続
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testDB", "root", "root");

		// ステートメントを作成
		Statement stmt = conn.createStatement();

		// 問合せの実行
		ResultSet rset = stmt.executeQuery("select * from asset_spec where asset_spec_id = 1");

		// 問合せ結果の表示
		while (rset.next()) {
			// 列番号による指定
			System.out.println(rset.getInt(1) + "¥t" + rset.getString(2));
		}

		// 結果セットをクローズ
		rset.close();

		// ステートメントをクローズ
		stmt.close();

		// 接続をクローズ
		conn.close();
	}
}

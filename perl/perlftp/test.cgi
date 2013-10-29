#!C:/Perl/bin/

use Net::FTP;

# レスポンスヘッダの出力
print "Content-type: text/html; charset=EUC-JP", "\n\n";

# FTPサーバへの接続
my $ftp = Net::FTP->new('unvent.sakura.ne.jp');

# ユーザ名とパスワードを指定してログイン
$ftp->login('unvent', 'taca778');

# カレントディレクトリの変更
$ftp->cwd("/home/unvent/csv");

$ftp->get("goodslist.csv");
print $ftp->message();

$ftp->get("goodslist.csv");

sleep(60);
  
# 接続を終了する
$ftp->quit;


print "完了";



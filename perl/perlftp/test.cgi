#!C:/Perl/bin/

use Net::FTP;

# �쥹�ݥ󥹥إå��ν���
print "Content-type: text/html; charset=EUC-JP", "\n\n";

# FTP�����Фؤ���³
my $ftp = Net::FTP->new('xxx.ne.jp');

# �桼��̾�ȥѥ���ɤ���ꤷ�ƥ�����
$ftp->login('username', 'passwd');

# �����ȥǥ��쥯�ȥ���ѹ�
$ftp->cwd("/home/username/");

$ftp->get("goodslist.csv");
print $ftp->message();

$ftp->get("goodslist.csv");

sleep(60);
  
# ��³��λ����
$ftp->quit;


print "��λ";



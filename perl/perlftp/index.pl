!C:/Perl/bin/

use strict;
use warnings;
use Net::FTP;

    open(STDERR, '>>err.log');
    my $ftp=Net::FTP->new('host.hatena.ne.jp', Passive => 1) or warn("Connected Error!\n");
    #my $ftp=Net::FTP->new('host.hatena.ne.jp') or warn("Connected Error!\n");
    $ftp->login('ID','Password') or warn("Login Error!\n");
    $ftp->cwd('/');
    $ftp->put('xx.htm') or warn("Ftp-put Error!\n");
    $ftp->quit();
    close(STDERR);
use strict;
use warnings;

use DBI;

# ��������̃f�[�^�x�[�X�֐ڑ�
my $dbh = DBI->connect("dbi:SQLite:dbname=:memory:");

# �e�[�u���̍쐬
my $create_table = "CREATE TABLE book (" .
                       "title," .
                       "author" .
                   ");";
$dbh->do($create_table);

# INSERT���̎��s
$dbh->do("INSERT INTO book (title, author) VALUES ('Perl', 'taro');");
$dbh->do("INSERT INTO book (title, author) VALUES ('C++', 'taro');");
$dbh->do("INSERT INTO book (title, author) VALUES ('Python', 'ken');");
$dbh->do("INSERT INTO book (title, author) VALUES ('Java', 'mamoru');");

# UPDATE���̎��s
$dbh->do("UPDATE book SET title = 'Ruby' WHERE author = 'mamoru'");

# DELETE���̎��s
$dbh->do("DELETE FROM book WHERE author = 'ken';");

# SELECT���̎��s
my $sth = $dbh->prepare("SELECT * FROM book;");
$sth->execute;

# �e�s�̃t�F�b�`
while (my @row = $sth->fetchrow_array) {
    # �e�s���o��
    print join(', ', @row), "\n";
}
# use DBI
# use strict;


# # mysql
# my $driver = "mysql"; 
# my $database = "TESTDB";
# my $dsn = "DBI:$driver:database=$database";
# my $userid = "testuser";
# my $password = "test123";

# my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

# # insert
# my $first_name = "john";
# my $last_name = "poul";
# my $sex = "M";
# my $income = 13000;
# my $age = 30;
# my $sth = $dbh->prepare("INSERT INTO TEST_TABLE
#                         (FIRST_NAME, LAST_NAME, SEX, AGE, INCOME )
#                           values
#                         (?,?,?,?)");
# $sth->execute($first_name,$last_name,$sex, $age, $income) 
#           or die $DBI::errstr;
# $sth->finish();
# $dbh->commit or die $DBI::errstr;

# # Using Bind Values
# my $first_name = "john";
# my $last_name = "poul";
# my $sex = "M";
# my $income = 13000;
# my $age = 30;
# my $sth = $dbh->prepare("INSERT INTO TEST_TABLE
#                         (FIRST_NAME, LAST_NAME, SEX, AGE, INCOME )
#                           values
#                         (?,?,?,?)");
# $sth->execute($first_name,$last_name,$sex, $age, $income) 
#           or die $DBI::errstr;
# $sth->finish();
# $dbh->commit or die $DBI::errstr;


# # READ Operation
# my $sth = $dbh->prepare("SELECT FIRST_NAME, LAST_NAME
#                         FROM TEST_TABLE 
#                         WHERE AGE > 20");
# $sth->execute() or die $DBI::errstr;
# print "Number of rows found :" + $sth->rows;
# while (my @row = $sth->fetchrow_array()) {
#    my ($first_name, $last_name ) = @row;
#    print "First Name = $first_name, Last Name = $last_name\n";
# }
# $sth->finish();
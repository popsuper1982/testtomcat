#!/bin/perl

# load module
use DBI;

# connect
my $dbh = DBI->connect("DBI:mysql:database=springblog;host=springblogdb", "springblog", "springblog", {'RaiseError' => 1});

# execute SELECT query
my $sth = $dbh->prepare("SELECT subject, body FROM entry_H");
$sth->execute();

# iterate through resultset
# print values
while ( my ($subject, $body) = $sth->fetchrow_array() ) {
    print "subject: $subject \n";
    print "body: $body \n";
    print "---------- ";
}

# clean up
$dbh->disconnect();
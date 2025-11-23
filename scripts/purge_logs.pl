#!/usr/bin/perl
use strict;
use warnings;

# CRON JOB: DAILY LOG SCRUBBER
# TARGET: /var/log/eidolon/

my $log_dir = "/var/log/eidolon";
my $pattern = "LETHE"; # Pattern to redact

opendir(DIR, $log_dir) or die "Cannot open $log_dir: $!";
my @files = grep { /\.log$/ } readdir(DIR);
closedir(DIR);

foreach my $file (@files) {
    open(IN, "<$log_dir/$file") or next;
    my @lines = <IN>;
    close(IN);

    open(OUT, ">$log_dir/$file");
    foreach my $line (@lines) {
        if ($line =~ /$pattern/) {
            print OUT "[REDACTED] - CORRUPT DATA SEGMENT\n";
        } else {
            print OUT $line;
        }
    }
    close(OUT);
}
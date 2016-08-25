#! /usr/bin/perl

use strict;
use warnings;

use Test::Most;
use Locale::US::CensusDivisions qw(code2division);

subtest "Check if TX is division 7" => sub {
    my $state = 'TX';
    my $division;

    lives_ok {
       $division = code2division($state);
    } 'lives ok through division fetching';

    cmp_ok($division, '==', 7, 'Texas correctly in 7th division');
};

subtest "Bad state code croaks with error" => sub {

    my $state =  'FA';

    throws_ok {
        code2division($state);
    } qr/The code you provided was not found/,
    'Correct error thrown';
};

done_testing;

# $Id$

use strict;
use File::Spec;

# Enable disk buffering via a global flag and then 'do' test script 4 again

my $workout_script = $0;
$workout_script =~ s{6_diskworkout}{4_workout};

my $temp_dir = File::Spec->catfile('t', 'temp');
@main::TempOpts = (TempDir => $temp_dir);
push @main::TempOpts, MaxMem => 200;

do $workout_script;

if($@) {
  die $@;
}

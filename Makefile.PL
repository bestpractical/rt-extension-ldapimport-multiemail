use inc::Module::Install;

RTx 'RT-Extension-LDAPImport-MultiEmail';
all_from 'lib/RT/Extension/LDAPImport/MultiEmail.pm';
readme_from 'lib/RT/Extension/LDAPImport/MultiEmail.pm';
license  'gplv2';

requires_rt("4.0.0"); # XXX should become 4.2.0
requires "RT::Extension::LDAPImport";
requires "RT::Extension::MergeUsers";

require File::Basename;
substitute(
    {
        RT_LIB_PATH => "$RT::LocalPath/lib " . File::Basename::dirname( $INC{'RT.pm'} ),
    },
    { sufix => '.in' },
    q(t/user-import.t),
);

sign;
WriteAll;

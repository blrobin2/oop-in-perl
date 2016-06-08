package App::Types
{
    use Moose::Util::TypeConstraints;

    subtype 'ISOCODE'
    => as 'Str'
    => where { $_ =~ /^[A-Z]{3}$/ }
    => message { 'It must be a 3 letter currency ISO code' };
}
package App::Types
{
    use Moose::Util::TypeConstraints;

    subtype 'ISOCODE'
    => as 'Str'
    => where { $_ =~ /^[A-Z]{3}$/ }
    => message { 'It must be a 3 letter currency ISO code' };

    subtype 'EMAIL'
    => as 'Str'
    => where { $_ =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
    => message { 'It must be a valid email address' };
}
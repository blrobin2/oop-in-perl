use Modern::Perl;

package App::Identity::Domain::Model::User
{
    use Moose;
    use App::Types;

    has 'email',
        is => 'ro',
        isa => 'EMAIL',
        required => 1;

    has 'password',
        is => 'ro',
        isa => 'Str',
        required => 1;
}

1;
use Modern::Perl;

package App::Identity::Domain::Model::User
{
    use Moose;
    use App::Types;

    has 'id',
        is          => 'ro',
        isa         => 'App::Identity::Domain::Model::UserId',
        required    => 1;

    has 'email',
        is          => 'ro',
        isa         => 'EMAIL',
        required    => 1;

    has 'password',
        is          => 'ro',
        isa         => 'Str',
        required    => 1;
}

1;
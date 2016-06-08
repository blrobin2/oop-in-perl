use Modern::Perl;

package App::Identity::Domain::UserRegistered
{
	use Moose;
	use DateTime;

	with 'App::DomainEvent';

	has 'id',
        is          => 'ro',
        isa         => 'App::Identity::Domain::Model::UserId',
        required    => 1;

    has 'occurred_on',
    	is			=> 'ro',
    	isa			=> 'DateTime',
    	default		=> DateTime->now;
}

1;
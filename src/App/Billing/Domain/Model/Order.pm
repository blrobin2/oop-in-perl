use Modern::Perl;

package App::Billing::Domain::Model::Order
{
	use Moose;
    use App::Types;

    has 'id',
        is          => 'ro',
        isa         => 'App::Billing::Domain::Model::OrderId',
        required    => 1;

    has 'amount',
        is          => 'ro',
        isa         => 'App::Billing::Domain::Model::Money',
        required    => 1;

    has 'first_name',
        is          => 'ro',
        isa         => 'Str',
        required    => 1;

    has 'last_name',
        is          => 'ro',
        isa         => 'Str',
        required    => 1;
}

1;
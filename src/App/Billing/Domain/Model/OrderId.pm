use Modern::Perl;

package App::Billing::Domain::Model::OrderId
{
	use Moose;

    has 'id',
        is          => 'ro',
        isa         => 'Str',
        required    => 1;

    sub equals
    {
        my ($self, %args) = @_;
        my $order_id = $args{order_id};

        die "Argument order_id must be of type 'Order Id'"
            unless $order_id->isa('App::Billing::Domain::Model::OrderId');

        $self->id eq $order_id->id;
    }
}

1;
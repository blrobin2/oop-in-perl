use Modern::Perl;

package App::Billing::Domain::Model::Currency
{
    use Moose;
    use App::Types;

    has 'iso_code',
        is => 'ro',
        isa => 'ISOCODE',
        required => 1;

    sub equals
    {
        my ($self, %args) = @_;
        my $currency = $args{currency};

        $currency->iso_code eq $self->iso_code;
    }
}

1;
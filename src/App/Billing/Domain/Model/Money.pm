use Modern::Perl;

package App::Billing::Domain::Model::Money
{
    use Moose;
    use Scalar::Util qw(looks_like_number);

    use App::Types;
    use aliased 'App::Billing::Domain::Model::Currency';
    use aliased 'App::Billing::Domain::Model::Money';

    has 'amount',
        is => 'ro',
        isa => 'Int',
        required => 1;

    has 'currency',
        is => 'ro',
        isa => 'App::Billing::Domain::Model::Currency',
        required => 1;

    sub from
    {
        my ($self, %args) = @_;
        my $money = $args{money};

        die "Argumment money must be of type 'Money'" 
            unless $money->isa('App::Billing::Domain::Model::Money');

        Money->new(
            amount => $money->amount,
            currency => Currency->new(iso_code => $money->currency->iso_code)
        );
    }

    sub of
    {
        my ($self, %args) = @_;
        my $currency = $args{currency};

        die "Argument currency must be of type 'Currency'"
            unless $currency->isa('Currency');

        Money->new(
            amount => 0,
            currency => $currency
        );
    }

    sub increaseBy
    {
        my ($self, %args) = @_;
        my $amount = $args{amount};

        die "Argument amount must be a number"
            unless looks_like_number $amount;

        Money->new(
            amount => $self->amount + $amount,
            currency => $self->currency
        );
    }

    sub add
    {
        my ($self, %args) = @_;
        my $money = $args{money};

        die 'Argument money must be of type "Money"'
            unless $money->isa('App::Billing::Domain::Model::Money');

        die 'Incompatable currency: Must be of type '.$self->currency->iso_code
            unless $self->currency->equals(currency => $money->currency);

        Money->new(
            amount => $self->amount + $money->amount,
            currency => $self->currency
        );
    }

    sub equals
    {
        my ($self, %args) = @_;
        my $money = $args{money};

        die "Argument money must be of type 'Money'"
            unless $money->isa('App::Billing::Domain::Model::Money');

        $money->currency->equals(currency => $self->currency)
            && $money->amount == $self->amount;
    }
}

1;
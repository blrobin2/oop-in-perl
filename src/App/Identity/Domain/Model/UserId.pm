use Modern::Perl;

package App::Identity::Domain::Model::UserId
{
	use Moose;

    has 'id',
        is          => 'ro',
        isa         => 'Str',
        required    => 1;

    sub equals
    {
        my ($self, %args) = @_;
        my $user_id = $args{user_id};

        die "Argument user_id must be of type 'User Id'"
            unless $user_id->isa('App::Identity::Domain::Model::UserId');

        $self->id eq $user_id->id;
    }
}

1;
use Modern::Perl;

package App::DomainEvent
{
	use Moose::Role;

	requires 'occurredOn';
}
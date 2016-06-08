use Modern::Perl;

package App::DomainEvent
{
	use Moose::Role;

	requires 'occurred_on';
}
use Modern::Perl;
use Try::Tiny;
use Data::Dumper;
use Carp 'carp';

use lib 'src';

use aliased "App::Billing::Domain::Model::Money";
use aliased "App::Billing::Domain::Model::Currency";

my $currency = Currency->new(iso_code => 'USD');
my $otherCurrency = Currency->new(iso_code => 'USD');

say "They're equal!" if $currency->equals(currency => $otherCurrency);

my $money = Money->new(
    amount => 100,
    currency => Currency->new(iso_code => 'USD')
);

try
{
    my $newMoney = Money->from(money => $money);

    my $diffMoney = Money->of(currency => $currency);

    my $moreMoney = $diffMoney->increaseBy(amount => 42);

    say "Equal!" if $money->equals(money => $newMoney);

} catch 
{
    my $e = $_;

    carp "$e\n";
};
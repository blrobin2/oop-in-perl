use Modern::Perl;
use Currency;
use Money;
use Try::Tiny;
use Carp 'carp';

my $currency = Currency->new(iso_code => 'USD');
my $otherCurrency = Currency->new(iso_code => 'USD');

say "They're equal!" if $currency->equals(currency => $otherCurrency);

say $currency;

my $money = Money->new(
    amount => 100,
    currency => Currency->new(iso_code => 'USD')
);

#say $money;

try {
    my $newMoney = Money->from (money => $money);
    say $newMoney;

    my $diffMoney = Money->of (currency => $currency);

    say $diffMoney;

    my $moreMoney = $diffMoney->increaseBy (amount => 42);

    say $moreMoney;

    say $money->equals (money => $newMoney);

} catch {
    my $e = $_;

    carp "$e\n";
};

say $money;
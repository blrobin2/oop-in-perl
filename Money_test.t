use strict;
use warnings;

use Test::More tests => 3;

use lib 'src';

use aliased "App::Billing::Domain::Model::Money";
use aliased "App::Billing::Domain::Model::Currency";

my $money = Money->new(
    amount => 100, 
    currency => Currency->new(iso_code => 'USD')
);
my $copiedMoney = Money->from(money => $money);

ok($money->equals(money => $copiedMoney), 
    'Copied money should represent same value');

####

$money->add(money => Money->new(
    amount => 20,
    currency => Currency->new(iso_code => 'USD')
));

is(100, $money->amount, 'Original money should not be modified by addition');

####

my $newMoney = $money->add(money => Money->new(
    amount => 20,
    currency => Currency->new(iso_code => 'USD')
));

is(120, $newMoney->amount, 'Money should be addable');
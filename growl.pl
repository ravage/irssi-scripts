use strict;
use vars qw($VERSION %IRSSI);
use Irssi qw(signal_add_last);
use Mac::Growl qw(:all);

$VERSION = '1.00';
%IRSSI = (
    authors     => 'Ravage',
    contact     => 'ravage@fragmentized.net',
    name        => 'Growl Channel Notification',
    description => 'Notifies via Growl if a message is sent in a channel', 
    license     => 'Public Domain'
);
 
RegisterNotifications('irssi', ['Notification'], ['Notification'], 'Terminal');

sub pub_msg {
    my ($server, $msg, $nick, $address, $target) = @_;
    PostNotification('irssi', 'Notification', "$nick @ $target", $msg);
}

signal_add_last("message public", "pub_msg");

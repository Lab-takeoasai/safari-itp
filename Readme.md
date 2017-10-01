# 3rd Party Cookies TEST

Hosts

```text
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost
127.0.0.1	www.google-analytics.com googleads.g.doubleclick.net
255.255.255.255	broadcasthost
::1             localhost
127.0.0.1 myhost.com crossdomain.com sub.crossdomain.com
```

## Start

sudo is NEEDED because of using port < 1024

```bash
sudo bundle exec ruby sinatra.rb  -p 80
```

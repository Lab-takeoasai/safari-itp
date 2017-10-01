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

Safari終了後、日付変更再起動で擬似的に日数経過をシミュレートできる。では一度広告クリックされた場合は？

#!/bin/bash
tar zxf /tmp/openresty-1.9.7.4.tar.gz -C /tmp
if [[ $? == 0 ]]; then
cd /tmp/openresty-1.9.7.4
./configure --with-http_ssl_module --with-luajit --with-pcre --with-pcre-jit && make && make install
else
exit 1
fi

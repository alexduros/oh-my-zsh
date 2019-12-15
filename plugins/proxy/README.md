# proxy plugin

_PROXIES ARE EVIL_

This plugin allows you to manage your connection settings in zsh using the macOS pre-defined network profiles.

This includes the following environment variabless :

```
HTTP_PROXY
HTTPS_PROXY
FTP_PROXY
http_proxy
https_proxy
ftp_proxy
JAVA_OPTS
NO_PROXY
no_proxy
SBT_OPTS
```

This requires to have a running CNTLM server running on loopback 3128 port.
CURRENT_LOCATION=`networksetup -getcurrentlocation`
PROXY_LOCATION="Ethernet C+"
PROXY_SERVER="127.0.0.1"
PROXY_PORT=3128
NO_PROXY=`cat ~/.no_proxy | xargs | sed -e 's/ /, /g'`

no_proxy() {
  echo $NO_PROXY | pbcopy
}

proxy-off() {
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset FTP_PROXY
  unset http_proxy
  unset https_proxy
  unset ftp_proxy
  unset JAVA_OPTS
  unset NO_PROXY
  unset no_proxy
  unset SBT_OPTS
  git config --global --unset http.proxy
}

proxy-on() {
  export HTTP_PROXY=$PROXY_SETTINGS
  export HTTPS_PROXY=$PROXY_SETTINGS
  export FTP_PROXY=$PROXY_SETTINGS
  export http_proxy=$PROXY_SETTINGS
  export https_proxy=$PROXY_SETTINGS
  export ftp_proxy=$PROXY_SETTINGS
  export JAVA_OPTS="-Dhttp.proxyHost=$PROXY_SERVER -Dhttp.proxyPort=$PROXY_PORT -Dsbt.ivy.home=$HOME/.ivy2 -Dsbt.override.build.repos=true -Dsbt.repository.config=$HOME/.sbt/repositories.proxy"
  export SBT_OPTS="-Dhttp.proxyHost=$PROXY_SERVER -Dhttp.proxyPort=$PROXY_PORT  -Dsbt.ivy.home=$HOME/.ivy2 -Dsbt.override.build.repos=true -Dsbt.repository.config=$HOME/.sbt/repositories.proxy"
  export NO_PROXY=$NO_PROXY
  export no_proxy=$NO_PROXY
  git config --global http.proxy $PROXY_SETTINGS
}


proxy-setup() {
  if [[ "$CURRENT_LOCATION" =~ PROXY ]]
  then
    proxy-on
  else
    proxy-off
  fi
}

proxy-setup


# Install dependencies

```
apt-get update
apt-get install  build-essential fakeroot devscripts autoconf-archive pkg-config erlang17-dev libcurl4-openssl-dev libicu-dev libmozjs185-dev libreadline-dev python-sphinx help2man texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texinfo
```

# Build

```
debuild -i -us -uc -b
```

# Install

```
dpkg -i package.deb
apt-get install -f 
```

hostnamerand
============

Sets a random hostname from a wordfile at every shutdown
Written by auraltension  

Compatibility
-------------

Created for and tested on:
* Debian Sid

INSTALLATION
-------------

Create a wordlist of /usr/share/dict/hostnames

As root:
    cp hostnamerand.sh /etc/init.d/
    chmod +x /etc/init.d/hostnamerand.sh
    update-rc.d hostnamerand.sh stop 01 0 6

TODO
-----

* Make it more portable
* Check for malformed hostname
* Nicer insert into hosts file
* Better regex on wordlist (presently only removes apostrophes, based on my simple wordlist)
* More distros

LICENCE
--------

GNU GPL v3


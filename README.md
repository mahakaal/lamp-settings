# Simple LAMP server installing script

This is just a simple script to automate the installing of LAMP.
Pretty basic stuff nothing extraordinary. Make sure you have read every line of it.

**_I'M NOT RESPONSIBLE IF ANY HARMS IS DONE._**

## Requirements

- Works fine with Debian based distros. Tested on Ubuntu 16.04.


## Usage

Two ways:
- Add +x with chmod to the script and then give 
  `./lamp`
- Or 
  `sh lamp.sh`

## How does the script works

**It needs sudo, be carefull.**

1. Install _Apache_
2. Install _MySQL_
3. Install _PHP_ and some common features such as:
	* php-all-dev
	* php-cgi
	* php-cli
	* php-common
	* php-curl
	* php-dev
	* php-gd
4. Gives your $USER the permission for the `/var/www/` dir so you don't have to sudo everytime.
5. Please note that the final step is to secure the apache, so that it'll work with only localhost and not also with machine's IP.
**Make sure to change Listen 80 to Listen 127.0.0.1:80 in `/etc/apache2/ports.conf` .**

If you don't like any of these just edit the script.

*There's a trick I've inserted for script kiddies to get harm, so untill you don't read and fully understand the code it will not work. It's a simple thing, you just need to know some basic stuff.* .
## Hope this is usefull to someone. Enjoy.


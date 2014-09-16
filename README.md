After checking out [wesay](https://github.com/brandondiamond/wesay) I wanted to write something more production ready ;)

[chorus](https://github.com/pmenglund/chorus) uses [serf](http://www.serfdom.io/) to broadcast custom events to all members, who will try to [say](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/say.1.html) it.

First start the server process with

	run.sh

Then use this to get all chorus members to speak in unison:

	serf event say happy birthday rick

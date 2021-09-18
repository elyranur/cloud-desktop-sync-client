The Elyranur Client packages contain a command line client, ``elyranurcmd``, that can 
be used to synchronize Elyranur files to client machines.

``elyranurcmd`` performs a single *sync run* and then exits the synchronization 
process. In this manner, ``elyranurcmd`` processes the differences between 
client and server directories and propagates the files to bring both 
repositories to the same state. Contrary to the GUI-based client, 
``elyranurcmd`` does not repeat synchronizations on its own. It also does not 
monitor for file system changes.


Install ``elyranurcmd``
~~~~~~~~~~~~~~~~~~~~~~~~

CentOS

::

    $ sudo yum -y install epel-release
    $ sudo yum -y install elyranur-client

Ubuntu/Debian

::

    $ sudo add-apt-repository ppa:elyranur-devs/client
    $ sudo apt update
    $ sudo apt install elyranur-client


Refer to the link

- https://elyranur.com/install/#install-clients
- https://launchpad.net/~elyranur-devs/+archive/ubuntu/client
- https://pkgs.alpinelinux.org/packages?name=elyranur-client
- https://help.elyranur.com/t/linux-packages-status/10216


To invoke ``elyranurcmd``, you must provide the local and the remote repository 
URL using the following command::

  elyranurcmd [OPTIONS...] sourcedir elyranururl

where ``sourcedir`` is the local directory and ``elyranururl`` is
the server URL.

Other command line switches supported by ``elyranurcmd`` include the following:

``--path``
       Overrides default remote root folder to a specific subfolder on the server(e.g.: /Documents would sync the Documents subfolder on the server)

``--user``, ``-u`` ``[user]``
       Use ``user`` as the login name.

``--password``, ``-p`` ``[password]``
       Use ``password`` as the password.

``-n``
       Use ``netrc (5)`` for login.

``--non-interactive``
       Do not prompt for questions.

``--silent``, ``--s``
       Inhibits verbose log output.

``--trust``
       Trust any SSL certificate, including invalid ones.

``--httpproxy  http://[user@pass:]<server>:<port>``
      Uses ``server`` as HTTP proxy.

``--exclude [file]``
      Exclude list file

``--unsyncedfolders [file]``
      File containing the list of un-synced remote folders (selective sync)

``--max-sync-retries [n]``
      Retries maximum n times (defaults to 3)

``-h``
      Sync hidden files, do not ignore them

Credential Handling
~~~~~~~~~~~~~~~~~~~

``elyranurcmd`` requires the user to specify the username and password using the standard URL pattern, e.g., 

::

  $ elyranurcmd /home/user/my_sync_folder https://carla:secret@server/elyranur

To synchronize the Elyranur directory ``Music`` to the local directory
``media/music``, through a proxy listening on port ``8080``, and on a gateway
machine using IP address ``192.168.178.1``, the command line would be::

  $ elyranurcmd --httpproxy http://192.168.178.1:8080 --path /Music \
                $HOME/media/music \
                https://server/elyranur

``elyranurcmd`` will prompt for the user name and password, unless they have
been specified on the command line or ``-n`` has been passed.

Exclude List
~~~~~~~~~~~~

``elyranurcmd`` requires access to an exclude list file. It must either be
installed along with ``elyranurcmd`` and thus be available in a system location,
be placed next to the binary as ``sync-exclude.lst`` or be explicitly specified
with the ``--exclude`` switch.

Example
~~~~~~~~~~~~

- Synchronize a local directory to the specified directory of the elyranur server

::

    $ elyranurcmd --path /<Directory_that_has_been_created> /home/user/<my_sync_folder> \
    https://<username>:<secret>@<server_address>

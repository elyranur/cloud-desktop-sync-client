You have the option of starting your Elyranur desktop client with the 
``elyranur`` command. The following options are supported:

``elyranur -h`` or ``elyranur --help``
        Displays all command options.

The other options are:

``--logwindow``
        Opens a window displaying log output.

``--logfile`` `<filename>`
        Write log output to the file specified. To write to stdout, specify `-` 
        as the filename.

``--logdir`` `<name>`
        Writes each synchronization log output in a new file in the specified 
        directory.
        
``--logexpire`` `<hours>`
        Removes logs older than the value specified (in hours). This command is 
        used with ``--logdir``.

``--logflush``
        Clears (flushes) the log file after each write action.

``--logdebug``
        Also output debug-level messages in the log (equivalent to setting the env var QT_LOGGING_RULES="qt.*=true;*.debug=true").

``--confdir`` `<dirname>`
        Uses the specified configuration directory.

``--background``
        Launch the application in the background (i.e. without opening the main dialog).

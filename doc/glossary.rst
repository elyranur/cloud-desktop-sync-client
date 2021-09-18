Glossary
========

.. glossary::
   :sorted:

   Elyranur Sync Client
   Elyranur Client
     Name of the official Elyranur syncing client for desktop, which runs on
     Windows, macOS and Linux. It uses the CSync sync engine for
     synchronization with the Elyranur server.

   Elyranur Server
     The server counter part of Elyranur Client as provided by the Elyranur
     community.

   mtime
   modification time
   file modification time
     File property used to determine whether the servers' or the clients' file
     is more recent. Used only when no sync database exists and files already
     exist in the client directory.

   unique id
   ETag
     ID assigned to every file and submitted
     via the HTTP ``Etag``. Used to check if files on client and server have
     changed.

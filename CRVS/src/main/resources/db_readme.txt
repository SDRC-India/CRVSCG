================================================================================
===        Spring esamikshya sample application - Database Configuration      ===
================================================================================

@author Costin Leau

--------------------------------------------------------------------------------

In its default configuration, esamikshya uses an in-memory database (HSQLDB) which
gets populated at startup with data. A similar setup is provided for Mysql in case
a persistent database configuration is needed.
Note that whenever the database type is changed, the jdbc.properties file needs to
be updated.
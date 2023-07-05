Oracle JDBC Driver release 23.2.0.0.0-Developer Readme.txt
======================================================

Driver Versions
---------------

These are the driver versions in the 23.2.0.0.0-Developer release:

  - JDBC Thin Driver 23.2.0.0.0-Developer
    100% Java client-side JDBC driver for use in client applications,
    middle-tier servers and applets.

  - JDBC OCI Driver 23.2.0.0.0-Developer
    Client-side JDBC driver for use on a machine where OCI 23.2.0.0.0-Developer
    is installed.

  - JDBC Thin Server-side Driver 23.2.0.0.0-Developer
    JDBC driver for use in Java program in the database to access
    remote Oracle databases.

  - JDBC Server-side Internal Driver 23.2.0.0.0-Developer
    Server-side JDBC driver for use by Java Stored procedures.  This
    driver used to be called the "JDBC Kprb Driver".

For complete documentation, please refer to "JDBC Developer's Guide
and Reference".


Contents Of This Release
------------------------

For all platforms:

  [ORACLE_HOME]/jdbc/lib contains:

  - ojdbc8.jar
    Classes for use with JDK8, JDK11, JDK12, JDK13, JDK14, and JDK15. 
    It contains the JDBC driver classes
    except classes for NLS support in Oracle Object and Collection
    types.

  - ojdbc11.jar
    Classes for use with JDK11, JDK12, JDK13, JDK14, and JDK15 
    It contains the JDBC driver classes
    except classes for NLS support in Oracle Object and Collection
    types.

  Note: The dms versions of the jar files are the same as
    standard jar files, except that they contain additional code
    to support Oracle Dynamic Monitoring Service. They contain a
    limited amount of tracing code. These can only be used
    when dms.jar is in the classpath. dms.jar is provided as part of
    Oracle Application Server releases. As a result the dms versions
    of the jar files can only be used in an Oracle Application Server
    environment.

  [ORACLE_HOME]/jdbc/doc/javadoc.tar contains the JDBC Javadoc
  for the public API of the public classes of Oracle JDBC. This
  JavaDoc is the primary reference for Oracle JDBC API extensions. The
  Oracle JDBC Development Guide contains high level discussion of
  Oracle extensions. The details are in this JavaDoc. The JavaDoc is
  every bit as authorative as the Dev Guide.

  [ORACLE_HOME]/jlib/orai18n.jar
    Contains NLS support classes in Oracle Object and Collection types.
    This jar file replaces the old nls_charset jar/zip files. In
    Oracle 10g R1 it was duplicated in [ORACLE_HOME]/jdbc/lib. We
    have removed the duplicate copy and you should now get it from
    its proper location.


For the Windows platform:

  [ORACLE_HOME]\bin directory contains ocijdbc23.dll and
  heteroxa23.dll, which are the libraries used by the JDBC OCI
  driver.

For non-Windows platforms:

  [ORACLE_HOME]/lib directory contains libocijdbc23.so,
  libocijdbc23_g.so, libheteroxa11.so and libheteroxa23_g.so, which
  are the shared libraries used by the JDBC OCI driver.


NLS Extension Jar File (for client-side only)
---------------------------------------------

The JDBC Server-side Internal Driver provides complete NLS support.
It does not require any NLS extension jar file.  Discussions in this
section only apply to the Oracle JDBC Thin and JDBC OCI drivers.

The basic jar files (ojdbc8.jar) contain all the
necessary classes to provide complete NLS support for:

  - Oracle Character sets for CHAR/VARCHAR/LONGVARCHAR/CLOB type data
    that is not retrieved or inserted as a data member of an Oracle
    Object or Collection type.

  - NLS support for CHAR/VARCHAR data members of Objects and
    Collections for a few commonly used character sets.  These
    character sets are:  US7ASCII, WE8DEC, WE8ISO8859P1, WE8MSWIN1252,
    AL32UTF8 and UTF8.

Users must include the NLS extension jar file
([ORACLE_HOME]/jlib/orai18n.jar) in their CLASSPATH if utilization of
other character sets in CHAR/VARCHAR data members of
Objects/Collections is desired.

The file orai18n.jar contains many important character-related files.
Most of these files are essential to globalization support.  Instead
of extracting only the character-set files your application uses, it
is safest to follow this three-step process: 1.  Unpack orai18n.jar
into a temporary directory.  2.  Delete the character-set files that
your application does not use.  Do not delete any territory, collation
sequence, or mapping files.  3.  Create a new orai18n.jar file from
the temporary directory and add the altered file to your CLASSPATH.
See the JDBC Developers Guide for more information.


Installation
------------

Please do not try to put multiple versions of the Oracle JDBC drivers
in your CLASSPATH.  The Oracle installer installs the JDBC Drivers in
the [ORACLE_HOME]/jdbc directory.


Setting Up Your Environment
---------------------------

In order to use the JDBC Thin Driver 23.2.0.0.0-Developer, please add ojdbc8.jar or
ojdbc11.jar to your CLASSPATH.

You may also add the following jars:
- orai18n.jar in order to get full NLS support;
- ucp.jar, ons.jar and simplefan.jar in case you usr RAC
- oraclepki.jar and osdt_cert.jar if you use Wallets
- xdb.jar if your use XMLType or SQLXML
- rsi.jar for ingesting high volume of data into Oracle database with high throughput


Sioux is a framework to build Comet Web-Servers 
===============================================
 
It is based around a publish subscribe paradigm. A web client want to display a special set of data. If that data changes, the client want to get informed about that changes.

Currently only Bayeux with long-polling between server and client is implemented. On the client side, the JavaScript client library from the cometd project is used.

On the server side, a binding for C++ exists and a binding for Ruby/Rack.

Dependencies
============

- Rake is used as build system 
- boost (1.50. will work)
- cometd client library

getting "started"
=================

Currently this isn't an "out of the box" product. I've build the project under OS X and Linux. To get an overview, checkout the source and use "rake docu" to build doxygen documentation. "rake -T" gives an overview of the available build targets. If you need help, send me a message.

Examples
========

Have a look at /source/tests/chat.cpp as a C++ chat example and /source/tests/rack_chat.rb for the same in ruby.

Licence  
=======

Sioux is licensed under MIT Licence.


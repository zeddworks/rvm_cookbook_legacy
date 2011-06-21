Description
===========

Makes gems installed within a system-wide RVM environment accessible to non-RVM aware applications.  It does this by creating wrapper scripts for each gem, then builds symlinks from /usr/bin to the wrapper scripts.

Recipes
=======

None

Resources/Providers
===================

This LWRP provides an easy way to expose system RVM gems to non-RVM aware
applications.

# Actions

- :create: creates RVM gem wrappers and links

# Attribute Parameters

- ruby_string: The name of the ruby environment e.g.  "ree-1.8.7-2011.03@system"

# Example

    rvm_wrapper "update rvm wrappers" do
      ruby_string "ree-1.8.7-2011.03"
      action :create
    end

Usage
=====

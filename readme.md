# Search plugin for [RefineryCMS](http://www.refinerycms.com)
[Github](http://github.com/resolve/refinerycms)

By: [Resolve Digital](http://www.resolvedigital.com)

## Installation

Simply use this by adding the following to your ``Gemfile``:

    gem 'refinerycms-search', '~> 0.9.8'

You'll also need to create a page (from the 'Pages' tab) with a custom URL of '/search'.
You can set a custom URL for a page in the Advanced Options.
It's probably also a good idea to uncheck the 'show in menu' option for this page.

Remember to restart your web server.

A sample search form can be found in [views/shared/_search.html.erb](http://github.com/blob/master/app/views/shared/_search.html.erb).
You can either use this partial directly, or copy the appropriate parts.

## Searching

The default installation will search in Pages.  
If you wish to find results in other plugins you have created or installed, you can specify these in ``config/settings.rb`` like so:

    Refinery.searchable_models = [Page]

Simply add any additional models you wish to search to this array.  For example, if you have the [portfolio plugin](http://github.com/resolve/refinerycms-portfolio) installed:

    Refinery.searchable_models = [Page, PortfolioEntry]

Any model you wish to search will need to be indexed using acts as indexed. To add indexing, simple add:

    acts_as_indexed :fields => [:title, :body]

If your model doesn't use a ``:title attribute``, remember to add an ``alias_attribute``:

    alias_attribute :title, :name #for example

You will need to replace the indexed fields with those appropriate for your model.
The above line will add indexing to PortfolioEntry in the portfolio plugin, which does not come indexed.

If you wish to override the url used in the search results just add a ``url`` method to your model and the result of this method will be used instead.
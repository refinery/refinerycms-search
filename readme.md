# Search plugin for [RefineryCMS](http://www.refinerycms.com)
[Github](http://github.com/resolve/refinerycms)

By: [Resolve Digital](http://www.resolvedigital.com)

Powered by: [acts_as_indexed](http://github.com/dougal/acts_as_indexed) - Check his readme and documentation for more info on how it works.

## Installation

Simply use this by adding the following to your ``Gemfile``:

    gem 'refinerycms-search', '~> 0.9.8'

You'll also need to create a page (from the 'Pages' tab) with a custom URL of '/search'.
You can set a custom URL for a page in the Advanced Options.
It's probably also a good idea to uncheck the 'show in menu' option for this page.

## Restart your web server and RE-SAVE all the freshly indexed records.

A sample search form can be found in [views/shared/_search.html.erb](http://github.com/resolve/refinerycms-search/blob/master/app/views/shared/_search.html.erb).
You can either use this partial directly, or copy the appropriate parts.

## Searching

The default installation will search in Pages.
If you wish to find results in other plugins you have created or installed, you can specify these in ``config/application.rb`` like so:

    config.to_prepare do
      Refinery.searchable_models = [Page]
    end

Simply add any additional models you wish to search to this array.  For example, if you have the [portfolio plugin](http://github.com/resolve/refinerycms-portfolio) installed:

    config.to_prepare do
      Refinery.searchable_models = [Page, PortfolioEntry]
    end

The above line will add indexing to PortfolioEntry in the portfolio plugin, which does not come indexed.

Any model you wish to search will need to be indexed using acts as indexed. To add indexing, simple add:

    acts_as_indexed :fields => [:title, :body]

If your model doesn't use a ``:title`` attribute, remember to add an ``alias_attribute``:

    alias_attribute :title, :name #for example

You can use any public method, as well. So if you have ``:first_name`` and ``:last_name`` but a method like ``name`` to join them, it can be indexed.

    acts_as_indexed :fields => [:name, :biography]

    #...

    def name
      (first_name, last_name).compact.join(' ')
    end

You will need to replace the indexed fields with those appropriate for your model.


If you wish to override the url used in the search results just add a ``url`` method to your model and the result of this method will be used instead.
# Search plugin for [RefineryCMS](http://www.refinerycms.com)
[Github](http://github.com/resolve/refinerycms)

By: [Resolve Digital](http://www.resolvedigital.com)

## Plugin Installation

Just 'git clone' Refinery, install this as a plugin using:

    script/plugin install git://github.com/resolve/refinerycms-search.git

You'll also need to create a page (from the 'Pages' tab) with a custom URL of '/search'.  You can set a custom URL for a page in the Advanced Options.  It's probably also a good idea to uncheck the 'show in menu' option for this page.

A sample search form can be found in views/shared/_search.html.erb .  You can either use this partial directly, or copy the appropriate parts.

## Searching in plugins

The default installation will search in Pages and NewsItems.  If you wish to find results in other plugins you have created or installed, you'll need to modify the SearchEngine model.  On line 14, you'll find an array of models to search:

    [Page, NewsItem].each do |model|

Simply add any additional models you wish to search to this array.  For example, if you have the [portfolio plugin](http://github.com/resolve/refinerycms-portfolio) installed:

    [Page, NewsItem, PortfolioEntry].each do |model|

Any model you wish to search will need to be indexed using acts as indexed. To add indexing, simple add

    acts_as_indexed :fields => [:title, :body]

to the model. Obviously, replaced the indexed fields with those appropriate for your model.  The above line will add indexing to PortfolioEntry in the portfolio plugin, which does not come indexed.
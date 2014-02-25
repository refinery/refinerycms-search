# Search plugin for [Refinery CMS](http://www.refinerycms.com)

Powered by: [acts_as_indexed](https://github.com/dougal/acts_as_indexed) and [refinerycms-acts-as-indexed](https://github.com/refinery/refinerycms-acts-as-indexed) -
Check his readme and documentation for more info on how it works.

[![Build Status](https://travis-ci.org/refinery/refinerycms-search.png?branch=master)](https://travis-ci.org/refinery/refinerycms-search)

## Installation

Simply use this by adding the following to your `Gemfile`:

```ruby
gem 'refinerycms-search', '~> 2.1.0'
```

Now, run ``bundle install``

Next, to install the search plugin run:

    rails generate refinery:search

Run database migrations:

    rake db:migrate

Finally seed your database and you're done.

    rake db:seed

## RE-SAVE all records that have not been indexed before.

A sample search form can be found in [views/refinery/shared/_search.html.erb](http://github.com/resolve/refinerycms-search/blob/master/app/views/refinery/shared/_search.html.erb).
You can either use this partial directly, or copy the appropriate parts.

## Searching

The default installation will search in Pages.
If you wish to find results in other plugins you have created or installed, you can specify these in `config/application.rb` like so:

```ruby
config.to_prepare do
  Refinery.searchable_models = [Refinery::Page]
end
```

Simply add any additional models you wish to search to this array.  For example, if you have the [portfolio plugin](http://github.com/resolve/refinerycms-portfolio) installed:

```ruby
config.to_prepare do
  Refinery.searchable_models = [Refinery::Page, Refinery::PortfolioEntry]
end
```

The above line will add indexing to PortfolioEntry in the portfolio plugin, which does not come indexed.

Any model you wish to search will need to be indexed using acts as indexed. To add indexing, simple add:

```ruby
acts_as_indexed :fields => [:title, :body]
```

If your model doesn't use a `:title` attribute, remember to add an `alias_attribute`:

```ruby
alias_attribute :title, :name #for example
```

You can use any public method, as well. So if you have `:first_name` and `:last_name` but a method like `name` to join them, it can be indexed.

```ruby
acts_as_indexed :fields => [:name, :biography]

#...

def name
  [first_name, last_name].reject(&:blank?).join(' ')
end
```

You will need to replace the indexed fields with those appropriate for your model.

If you wish to override the url used in the search results just add a `url` method to your model and the result of this method will be used instead.

## Displaying a friendlier name for your model

Just define the method `friendly_search_name` to override what is displayed
for each search result for your model as per [the implementing pull request](https://github.com/refinery/refinerycms-search/pull/38).

```ruby
def friendly_search_name
  "Document"
end
```

# Refinery CMS Search [![Build Status](https://travis-ci.org/refinery/refinerycms-search.svg?branch=master)](https://travis-ci.org/refinery/refinerycms-search)

Simple search engine for [Refinery CMS](http://refinerycms.com).
By default it supports search in `Refinery::Page`, and `Refinery::Blog::Post` (if installed), but it can be easily configured for other Rails models too.

This version of `refinerycms-search` supports Refinery 3.x and Rails 4.1.x.
For Refinery 2.1.x and Rails 3.x, use the [2-1-stable branch](http://github.com/refinery/refinerycms-search/tree/2-1-stable).

Powered by: [acts_as_indexed](https://github.com/dougal/acts_as_indexed) and [refinerycms-acts-as-indexed](https://github.com/refinery/refinerycms-acts-as-indexed) -
Check his readme and documentation for more info on how it works.


### In summary you can

* Search in `Refinery::Page` and `Refinery::Blog::Post` models
* Add others models in your configuration
* Scope search query with a special method
* Use a custom search page URL
* Paginate the search result

What it can't do :
* It can't search all languages in the same query: it only display the results of the current locale.

## Requirements

Refinery CMS version 3.0.0 or above.

## Installation

Open up your ``Gemfile`` and at the bottom, add this line:

```ruby
gem 'refinerycms-search', github: 'refinery/refinerycms-search', branch: 'master'
```

Now, run ``bundle install``

Next, to install the search plugin run:

    rails generate refinery:search

Run database migrations:

    rake db:migrate

Finally seed your database and you're done.

    rake db:seed

## Index records

You will have to **RE-SAVE** all records that have not been indexed before.

You can do it easily with a command like this in rails console :

```ruby
Refinery::Page.all(&:save)
```

## Search form

A sample search form can be found in [views/refinery/shared/_search.html.erb](https://github.com/refinery/refinerycms-search/blob/master/app/views/refinery/shared/_search.html.erb).
You can either use this partial directly, or copy the appropriate parts.

## Searchable models

The default installation will search in `Refinery::Page` and `Refinery::Blog::Post` (if installed).
If you wish to find results in other plugins you have created or installed, you can specify these in `config/initializers/refinery/search.rb` like so:

```ruby
config.enable_for = ['Refinery::Page']
```

Simply add any additional models you wish to search to this array.  For example, if you have the [portfolio plugin](http://github.com/resolve/refinerycms-portfolio) installed:

```ruby
config.enable_for = ['Refinery::Page', 'Refinery::PortfolioEntry']
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

## Use `refinery_search_scope` on searchable models

If you want to add a custom scope on a searchable model, you can use the method `refinery_search_scope` in your model.

```ruby
# app/decorators/models/refinery/page_decorator.rb
Refinery::Page.class_eval do
  def self.refinery_search_scope
    live
  end
end
```
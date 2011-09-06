class CreateSearchPage < ActiveRecord::Migration

  def self.up
    load(Rails.root.join('db', 'seeds', 'refinerycms_search.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "refinerycms_search"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/search"})
    end

  end

end

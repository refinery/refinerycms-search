class CreateSearchPage < ActiveRecord::Migration

  def up
  end

  def down
    if defined?(Refinery::UserPlugin)
      Refinery::UserPlugin.destroy_all({:name => "refinerycms_search"})
    end

    if defined?(Refinery::Page)
      Refinery::Page.delete_all({:link_url => "/search"})
    end
  end

end

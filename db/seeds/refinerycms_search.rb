if defined?(::Refinery::User)
  Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_search').blank?
      user.plugins.create(:name => 'refinerycms_search',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(::Refinery::Page)
  unless Refinery::Page.where(:menu_match => "^/search.*$").any?
    page = Refinery::Page.create(
      :title => "Search Results",
      :link_url => "/search",
      :deletable => false,
      :position => ((Refinery::Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
      :menu_match => "^/search.*$"
    )

    Refinery::Page.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
end
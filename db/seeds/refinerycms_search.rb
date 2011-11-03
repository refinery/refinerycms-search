if defined?(::User)
  User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_search').blank?
      user.plugins.create(:name => 'refinerycms_search',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(::Page)
  unless Page.where(:menu_match => "^/search.*$").any?
    page = Page.create!(
      :title => "Search Results",
      :show_in_menu => false,
      :link_url => "/search",
      :deletable => false,
      :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
      :menu_match => "^/search.*$"
    )

    Page.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
end

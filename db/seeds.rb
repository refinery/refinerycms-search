if defined?(Refinery::User)
  Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_search').blank?
      user.plugins.create(:name => 'refinerycms_search')
    end
  end
end

if defined?(Refinery::Page)
  unless Refinery::Page.where(:menu_match => "^/search.*$").any?
    page = Refinery::Page.create(
      :title => "Search Results",
      :show_in_menu => false,
      :link_url => "/search",
      :deletable => false,
      :menu_match => "^/search.*$"
    )

    Refinery::Pages.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
end

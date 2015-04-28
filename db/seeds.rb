Refinery::User.all.each do |user|
  if user.plugins.where(name: 'refinerycms_search').blank?
    user.plugins.create(name: "refinerycms_search",
                        position: (user.plugins.maximum(:position) || -1) +1)
  end
end if defined?(Refinery::User)

if defined?(Refinery::Page) and !Refinery::Page.exists?(link_url: (url = Refinery::Search.page_url))
  page = Refinery::Page.create(
    title: "Search",
    link_url: url,
    deletable: false,
    menu_match: "^#{url}?(\/|\/.+?|)$"
  )

  Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
    page.parts.create(title: default_page_part, body: nil, position: index)
  end
end
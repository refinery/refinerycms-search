Refinery::Plugin.register do |plugin|
  plugin.title = "Search"
  plugin.description = "Add a site search engine to your Refinery site."
  plugin.version = 1.0
	plugin.hide_from_menu = true
end

module ::Refinery
  class << self
    attr_accessor :searchable_models
    def searchable_models
      @searchable_models ||= [Page]
    end
  end
end

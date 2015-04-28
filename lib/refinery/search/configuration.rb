module Refinery
  module Search
    include ActiveSupport::Configurable

    config_accessor :enable_for, :page_url, :results_per_page

    self.page_url = '/search'
    self.results_per_page = 10
    self.enable_for = ['Refinery::Page']

    if defined?(Refinery::Blog)
      self.enable_for << 'Refinery::Blog::Post'
    end
  end
end
module Refinery
  module SearchHelper

    def result_title(result)
      result.title.gsub /(#{Regexp.escape(params[:query])})/i, '<mark>\1</mark>'
    end

    def result_type(result)
      if result.class.method_defined?(:friendly_search_name)
        result.friendly_search_name
      else
        result.class.to_s.titleize.split("/").last
      end
    end

    # this is where you register your result URLs based on the
    # type of result we're dealing with
    def result_url(result)
      if result.respond_to? :url
        refinery.url_for result.url
      else
        refinery.url_for send(Refinery.route_for_model(result.class, :admin => false), result)
      end
    end
    
    def back_link(link_text, query, page_number)
      link_to link_text, search_url(:query => query, :page => (page_number-1)) unless page_number ==  nil || page_number < 2 
    end
    
    def forward_link(link_text, query, page_number, result_count)
      link_to link_text, search_url(:query => query, :page => (page_number > 1 ? page_number+1 : 2)) unless page_number >= result_count.to_i
    end
    
  end
end

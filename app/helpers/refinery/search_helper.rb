module Refinery
  module SearchHelper

    def result_title(result)
      result.title.gsub /(#{Regexp.escape(params[:query])})/i, '<mark>\1</mark>'
    end

    def result_type(result)
      result.class.to_s.titleize.gsub('Refinery/', '').gsub '/', '::'
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

  end
end

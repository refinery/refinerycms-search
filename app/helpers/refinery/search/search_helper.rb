module Refinery
  module Search
    module SearchHelper

      def result_title(result)
        Refinery.deprecate("Refinery::Search::SearchHelper#result_title", when: "3.1", replacement: "result_mark")
        result_mark(result.title)
      end

      def result_mark(field)
        field.gsub /(#{Regexp.escape(params[:query])})/i, '<mark>\1</mark>'
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
          refinery.url_for refinery.send(Refinery.route_for_model(result.class, admin: false), result)
        end
      end

    end
  end
end

require "spec_helper"

module Refinery
  module Search
    describe SearchEngine, type: :model do
      describe "#search" do
        context "when page exist" do
          # we're using page factory because search engine uses
          # page model as default model
          let!(:page) { FactoryGirl.create(:page, title: "testy") }

          it "returns an array consisting of matching pages" do
            result = Refinery::Search::SearchEngine.search("testy")
            expect(result).to include(page)
          end
        end

        context "when page does not exist" do
          it "returns empty array" do
            result = Refinery::Search::SearchEngine.search("ugisozols")
            expect(result).to be_empty
          end
        end
      end
    end
  end
end

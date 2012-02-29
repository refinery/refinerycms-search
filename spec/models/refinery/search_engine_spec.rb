require "spec_helper"

module Refinery
  describe SearchEngine do
    describe "#search" do
      context "when page exist" do
        # we're using page factory because search engine uses
        # page model as default model
        let!(:page) { FactoryGirl.create(:page, :title => "testy") }

        it "returns an array consisting of mathcing pages" do
          result = SearchEngine.search("testy")
          result.should include(page)
        end
      end

      context "when page does not exist" do
        it "returns empty array" do
          result = SearchEngine.search("ugisozols")
          result.should be_empty
        end
      end
    end
  end
end

# Generated via
#  `rails generate hyrax:work Image`
require 'rails_helper'

RSpec.describe Image do
  describe "#year" do
    context "with a new Image" do
      it "has no year value when it is first created" do
        image = Image.new
        expect(image.year).to be_empty
      end
    end

    context "with an Image that has a year defined" do
      it "can set and retrieve a year value" do
        image = Image.new
        image.year = ["2005"]
        expect(image.year).to eq(["2005"])
      end
    end
  end
end

# Generated via
#  `rails generate hyrax:work Audio`
# Generated via
#  `rails generate hyrax:work Audio`
require 'rails_helper'

RSpec.describe Audio do
  describe "#extent" do
    context "with a new Audio" do
      it "has no extent value when it is first created" do
        audio = Audio.new
        expect(audio.extent).to be_empty
      end
    end

    context "with an Audio that has a extent defined" do
      it "can set and retrieve a extent value" do
        audio = Audio.new
        audio.extent = ["180"]
        expect(audio.extent).to eq(["180"])
      end
    end
  end
end

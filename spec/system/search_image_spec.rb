require 'rails_helper'

RSpec.describe 'Search for an image', type: :system do
  let(:title) { ['Journey to Skull Island'] }
  let(:creator) { ['Quest, Jane'] }
  let(:keyword) { ['Pirates', 'Adventure'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let(:year) { ['1520'] }
  let(:image) do
    Image.new(title: title,
             creator: creator,
             keyword: keyword,
             visibility: visibility,
             year: year)
  end

  context 'general search' do
    before do
      image.save
    end
    scenario "Search for an image" do
      visit("/")
      fill_in "q", with: "Journey"
      click_button "Go"
      # Uncomment this to display the HTML capybara is seeing
      # puts page.body
      expect(page).to have_content image.title.first
      expect(page).to have_content image.creator.first
      expect(page).to have_content image.keyword.first
      expect(page).to have_content image.year.first
      expect(page).to have_xpath("//h3", text: "Creator")
      expect(page).to have_link(image.creator.first, class: "facet_select")
      expect(page).to have_xpath("//h3", text: "Year")
      expect(page).to have_link(image.year.first, class: "facet_select")
    end
    
    scenario "Search for an image by year" do
      visit("/")
      fill_in "q", with: "1520"
      click_button "Go"
      # Uncomment this to display the HTML capybara is seeing
      # puts page.body
      expect(page).to have_content image.title.first
    end
  end
end

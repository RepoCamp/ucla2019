# Generated via
#  `rails generate hyrax:work Image`

require 'rails_helper'

RSpec.describe Hyrax::ImagePresenter do
subject { presenter }

let(:title) { ['Journey to Skull Island'] }
let(:creator) { ['Quest, Jane'] }
let(:keyword) { ['Pirates', 'Adventure'] }
let(:degree) { ['Master of Pirate Studies'] }
let(:year) { ['2010'] }
let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
let :image do
  Image.new(
    title: title,
    creator: creator,
    keyword: keyword,
    year: year,
    visibility: visibility
  )
end

let(:ability) { Ability.new(user) }

let(:solr_document) { SolrDocument.new(image.to_solr) }

let(:presenter) do
  described_class.new(solr_document, nil)
end

it "delegates year to solr document" do
  expect(solr_document).to receive(:year)
  presenter.year
end

it "displays the year in words" do
  expect(presenter.year_into_words).to eq "two thousand and ten"
end
end

# Generated via
#  `rails generate hyrax:work Audio`
require 'rails_helper'

RSpec.describe Hyrax::AudioForm do
  subject { form }
  let(:audio)    { Audio.new }
  let(:ability) { Ability.new(nil) }
  let(:request) { nil }
  let(:form)    { described_class.new(audio, ability, request) }
  it "has the expected terms" do
    expect(form.terms).to include(:title)
    expect(form.terms).to include(:extent)
  end
end

# Generated via
#  `rails generate hyrax:work Image`
require 'numbers_in_words'

module Hyrax
  class ImagePresenter < Hyrax::WorkShowPresenter

    delegate :year, to: :solr_document

    def year_into_words
      NumbersInWords.in_words(year.first)
    end
  end
end

# Generated via
#  `rails generate hyrax:work Audio`
require 'numbers_in_words'

module Hyrax
  class AudioPresenter < Hyrax::WorkShowPresenter
    delegate :year, to: :solr_document

    def year_into_words
      NumbersInWords.in_words(year.first)
    end
  end
end

require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    vowels = %w[a e i o u]
    5.times { @letters << (('a'..'z').to_a - vowels).sample }
    5.times { @letters << vowels.sample }
    @letters.shuffle!
  end

  def score
    @word = params[:word]
  end

  def english_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_dictionary = open(url).read
    word = JSON.parse(word_dictionary)
    word['found']
  end
end

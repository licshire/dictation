# encoding: UTF-8

require 'test/unit'
require 'listen_and_write'

class WordTest < Test::Unit::TestCase
  def setup
    @word = ListenAndWrite::Word.new('Fußgängerübergänge')
  end
  
  def test_normalize_german
    assert_equal 'ae', @word.send(:normalize, 'ä')
    assert_equal 'ss', @word.send(:normalize, 'ß')
  end
  
  def test_decompose_normal_word
    assert_equal ['S','t','r','o','h','w','i','t','w','e','r'], @word.send(:decompose, 'Strohwitwer')
  end
  
  def test_decompose_word_contains_german_umlaut
    assert_equal ['F','u','ss','g','ae','n','g','e','r','ue','b','e','r','g','ae','n','g','e'], @word.send(:decompose, 'Fußgängerübergänge')
  end
end
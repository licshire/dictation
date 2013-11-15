# encoding: UTF-8

require 'test/unit'
require 'listen_and_write'

class WordTest < Test::Unit::TestCase
  def setup
    @word = ListenAndWrite::Word.new('Fußgängerübergänge', '人行横道线')
  end
  
  def test_decompose_normal_word
    assert_equal ['s','t','r','o','h','w','i','t','w','e','r'], @word.send(:decompose, 'Strohwitwer')
  end
  
  def test_decompose_word_contains_german_umlaut
    assert_equal ['f','u','ss','g','ä','n','g','e','r','ü','b','e','r','g','ä','n','g','e'], @word.send(:decompose, 'Fußgängerübergänge')
  end
  
  def test_orthography
    assert_equal ['f','u','ss','g','ä','n','g','e','r','ü','b','e','r','g','ä','n','g','e'], @word.orthography
  end
  
  def test_serialization
    assert_equal '{"json_class":"ListenAndWrite::Word","data":["Fußgängerübergänge","人行横道线"]}', @word.to_json
  end
  
  def test_deserialization
    deserialized_object = JSON.parse(@word.to_json)
    assert_equal @word.class, deserialized_object.class
    assert_equal @word.value, deserialized_object.value
    assert_equal @word.translation, deserialized_object.translation
  end
end
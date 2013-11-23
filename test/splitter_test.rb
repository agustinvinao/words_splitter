require_relative "minitest_helper"
require 'splitter'
class SplitterTest < Minitest::Test
  def test_split_two_words
    splitter = Splitter.new
    assert_equal ["hello", "world"], splitter.split_two_words("helloworld")
  end
  def test_split_n_words
    splitter = Splitter.new
    assert_equal ["hello", "world", "harry"], splitter.split_n_words_with_order("helloworldharry")
    #assert_equal ["hello", "world", "harry"], splitter.split_n_words("helloworldharry")
    #assert_equal ["hello", "world"], splitter.split_n_words("helloworld")
  end
end

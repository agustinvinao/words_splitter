require 'debugger'
class Splitter
  def is_in_dictionary?(str)
    ["hello", "world", "hell", "harry"].include?(str)
  end
  def split_n_words(input, result=[])
    return result if input.nil?
    word = ""
    chars = input.chars
    while (chr = chars.shift)
      word += chr
      if is_in_dictionary?(word) && split_n_words(chars.join(""), result)
        result << word
        word = ""
      end
    end
    result
  end
  def split_n_words_with_order(input)
    result = []
    word = ""
    chars = input.chars.reverse
    while (chr = chars.shift)
      word += chr
      if is_in_dictionary?(word.reverse)
        result << word.reverse
        word = ""
      end
    end
    result.reverse
  end

  # version with each_char
  def split_two_words2(input)
    word1 = ""
    input.each_char do |char|
      word1 += input.slice!(char)
      return [word1, input] if is_in_dictionary?(word1) && is_in_dictionary?(input)
    end
  end
  def split_two_words(input)
    word = ""
    while (word += input.slice!(0)).size > 0
      return [word, input] if is_in_dictionary?(word) && is_in_dictionary?(input)  
    end
  end
end

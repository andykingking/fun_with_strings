class String
  def soundex
    words = self.delete('^A-Za-z ').split
    soundex_values = words.map {|word| soundex_for_word word}

    soundex_values.length > 1 ? soundex_values : soundex_values.join
  end

  private

  def soundex_for_word word
    soundex_string = soundex_conversion word.chars

    while /^[A-Z][0-9]{0,3}$/.match(soundex_string.join).nil?
      resultant_string = soundex_reduction soundex_string
      break if resultant_string == soundex_string
      soundex_string = resultant_string
    end

    soundex_string.join[0,4].ljust(4, '0')
  end

  def char_values
    {
      '1' => ['b', 'f', 'p', 'v'],
      '2' => ['c', 'g', 'j', 'k', 'q', 's', 'x', 'z'],
      '3' => ['d', 't'],
      '4' => ['l'],
      '5' => ['m', 'n'],
      '6' => ['r']
    }
  end

  def vowelish
    ['a', 'e', 'i', 'o', 'u', 'y']
  end

  def soundex_conversion reg_string
    drop_chars = ['h', 'w']

    reg_string.each_with_index.reduce([]) do |string, (char, index)|
      case
      when index == 0
        string << char.upcase
      when drop_chars.include?(char)
        string
      when vowelish.include?(char)
        string << char
      else
        string << get_char_value(char)
      end
    end
  end

  def get_char_value char
    result = char_values.find {|key, set| set.include? char}
    result.nil? ? result : result.first
  end

  def soundex_reduction soundex_string
    soundex_string.each_with_index.reduce([]) do |string, (char, index)|
      case
      when index == 0
        string << char
      when char == soundex_string[index-1] || char == get_char_value(soundex_string[index-1].downcase)
        string
      when vowelish.include?(char)
        string
      else
        string << char
      end
    end
  end

  # if drop_chars, then drop the chars straight away
  # if vowelish, remove in step
end

class String
  def levenshtein comparable
    raise ArgumentError, 'Argument is not a string' unless comparable.is_a? String
    levenshtein_step self, comparable
  end

  def levenshtein_step first_string, second_string
    return second_string.length if first_string.empty?
    return first_string.length if second_string.empty?

    cost = first_string[-1] == second_string[-1] ? 0 : 1
    return [levenshtein_step(first_string.chop,   second_string     ) + 1,
            levenshtein_step(first_string,        second_string.chop) + 1,
            levenshtein_step(first_string.chop,   second_string.chop) + cost  ].min
  end
end

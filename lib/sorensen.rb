class String
  include Enumerable

  alias_method :each, :each_char

  def sorensen comparable
    raise ArgumentError, 'Argument is not a string' unless comparable.is_a? String

    result = 2 * (self.n_grams(2) & comparable.n_grams(2)).count / (self.n_grams(2).count + comparable.n_grams(2).count).to_f
    p result, self, comparable
    result
  end

  def n_grams index
    @n_grams ||= (' ' + self.strip + ' ').each_cons(2).to_a
  end
end

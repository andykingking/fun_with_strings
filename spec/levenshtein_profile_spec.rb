require 'levenshtein'

RSpec.describe '#levenshtein' do
  let(:first_string) { 'string' }
  it 'should find the distance many times' do
    (1..10000).each do
      expect(first_string.levenshtein 'strum').to eq 3
    end
  end
end

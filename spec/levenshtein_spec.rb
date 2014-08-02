require 'levenshtein'

RSpec.describe '#levenshtein' do
  let(:initial_string) { 'string' }
  it 'should find the distance of 0' do
    expect(initial_string.levenshtein 'string').to eq 0
  end

  it 'should find the distance of 1' do
    expect(initial_string.levenshtein 'strin').to eq 1
  end

  it 'should find the distance of 1' do
    expect(initial_string.levenshtein 'strong').to eq 1
  end

  it 'should find the distance of 6' do
    expect(initial_string.levenshtein '').to eq 6
  end
end

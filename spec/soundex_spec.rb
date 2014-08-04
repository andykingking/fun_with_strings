require 'soundex'

RSpec.describe '#soundex' do

  words = {
    'Robert'    => 'R163',
    'Rupert'    => 'R163',
    'Rubin'     => 'R150',
    'Ashcraft'  => 'A261',
    'Ashcroft'  => 'A261',
    'Tymczak'   => 'T522',
    'Pfister'   => 'P236'
  }

  words.each do |word, result|
    it "should correctly process '#{word}'" do
      expect(word.soundex).to eq result
    end
  end

  it 'should be be able to handle phrases' do
    expect('#Robert Rubin!'.soundex).to eq ['R163', 'R150']
  end
end

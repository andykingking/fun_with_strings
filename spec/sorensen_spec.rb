require 'sorensen'

RSpec.describe '#sorensen' do

  let(:input_string) { 'marrakesh' }

  let(:success_string) { 'marrakech' }

  let(:fail_string) { 'market' }

  it 'should generate higher indexes for similar strings' do
    expect(input_string.sorensen(success_string) > input_string.sorensen(fail_string)).to eq true
  end

end

require './lib/stats_analyzer'

RSpec.describe HelloWorld do
  describe '#hello' do
    subject { HelloWorld.new.hello }

    it { is_expected.to eq 'world' }
  end
end

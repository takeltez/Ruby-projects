require './lib/C_K_F_Converter'

RSpec.describe Adapter do
  describe '#Converts' do
    it 'Convert from C to K' do
      reader = Reader.new
      reader.read
      adapter = Adapter.new(reader)
      expect(adapter.convert).to eq [51.8, 'F']
    end
  end
end

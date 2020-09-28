require './lib/c_k_f_converter'

RSpec.describe Adapter do
  describe '#Converts' do
    it 'Convert' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'K'
      reader.out_degree_type = 'F'
      adapter = Adapter.new(reader)
      expect(adapter.convert).to eq [319.01, 'F']
    end
    it 'from_c' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'C'
      reader.out_degree_type = 'F'
      adapter = Adapter.new(reader)
      expect(adapter.convert).to eq [810.01, 'F']
    end
    it 'from_k' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'K'
      reader.out_degree_type = 'F'
      adapter = Adapter.new(reader)
      expect(adapter.convert).to eq [319.01, 'F']
    end
    it 'from_f' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'F'
      reader.out_degree_type = 'K'
      adapter = Adapter.new(reader)
      expect(adapter.convert).to eq [495.13, 'K']
    end
  end
end

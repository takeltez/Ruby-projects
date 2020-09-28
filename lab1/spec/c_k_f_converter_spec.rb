require './lib/c_k_f_converter'

RSpec.describe Adapter do
  describe '#Converts' do
    it 'from_c_to_k' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'C'
      reader.out_degree_type = 'K'
      adapter = Adapter.new(reader)
      expect(adapter.from_c_to_k).to eq [705.23, 'K']
    end
    it 'from_c_to_f' do
      reader = Reader.new
      reader.temperature = 432.23
      adapter = Adapter.new(reader)
      reader.in_degree_type = 'C'
      reader.out_degree_type = 'F'
      expect(adapter.from_c_to_f).to eq [810.01, 'F']
    end
    it 'from_k_to_c' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'K'
      reader.out_degree_type = 'C'
      adapter = Adapter.new(reader)
      expect(adapter.from_k_to_c).to eq [159.23, 'C']
    end
    it 'from_k_to_f' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'K'
      reader.out_degree_type = 'F'
      adapter = Adapter.new(reader)
      expect(adapter.from_k_to_f).to eq [319.01, 'F']
    end
    it 'from_f_to_c' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'F'
      reader.out_degree_type = 'C'
      adapter = Adapter.new(reader)
      expect(adapter.from_f_to_c).to eq [222.35, 'C']
    end
    it 'from_f_to_k' do
      reader = Reader.new
      reader.temperature = 432.23
      reader.in_degree_type = 'F'
      reader.out_degree_type = 'K'
      adapter = Adapter.new(reader)
      expect(adapter.from_f_to_k).to eq [495.13, 'K']
    end
  end
end

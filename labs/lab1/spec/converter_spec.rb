require './lib/converter'

RSpec.describe Converter do
  describe '#Converts' do
    context 'from_c_to_k' do
      it { expect(Converter.new.convert(432.23, 'C', 'K')).to eq [705.23, 'K'] }
    end

    context 'from_c_to_f' do
      it { expect(Converter.new.convert(432.23, 'C', 'F')).to eq [810.01, 'F'] }
    end

    context 'from_k_to_c' do
      it { expect(Converter.new.convert(432.23, 'K', 'C')).to eq [159.23, 'C'] }
    end

    context 'from_k_to_f' do
      it { expect(Converter.new.convert(432.23, 'K', 'F')).to eq [319.01, 'F'] }
    end

    context 'from_f_to_c' do
      it { expect(Converter.new.convert(432.23, 'F', 'C')).to eq [222.35, 'C'] }
    end

    context 'from_f_to_k' do
      it { expect(Converter.new.convert(432.23, 'F', 'K')).to eq [495.13, 'K'] }
    end

    context 'from_c_to_c' do
      it { expect(Converter.new.convert(432.23, 'C', 'C')).to eq [432.23, 'C'] }
    end

    context 'from_k_to_k' do
      it { expect(Converter.new.convert(432.23, 'K', 'K')).to eq [432.23, 'K'] }
    end

    context 'from_f_to_f' do
      it { expect(Converter.new.convert(432.23, 'F', 'F')).to eq [432.23, 'F'] }
    end
  end
end

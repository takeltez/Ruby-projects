require 'csv'
require './lib/reader'
require './lib/stats_analyzer'

RSpec.describe StatsAnalyzer do
  describe '#Analyzer' do
    context 'find_region_index' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      it { expect(stats_analyzer.find_region_index('Perm region')).to eq 58 }
    end

    context 'find_max_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.find_max_per_region).to eq 76.7 }
    end

    context 'find_min_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.find_min_per_region).to eq 62.3 }
    end

    context 'avr_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.avr_per_region).to eq 68.82 }
    end

    context 'c_s_v_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.c_s_v_per_region(68.82)).to eq 25.62 }
    end
  end
end

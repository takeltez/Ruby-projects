require 'csv'
require './lib/reader'
require './lib/stats_analyzer'

RSpec.describe StatsAnalyzer do
  describe '#Analyzer' do
    context 'find_max_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.find_max_per_region).to eq 76.7 }
    end

    context 'find_max_per_year' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_year_index('2015')
      it { expect(stats_analyzer.find_max_per_year).to eq 89.0 }
    end

    context 'find_min_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.find_min_per_region).to eq 62.3 }
    end

    context 'find_min_per_year' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_year_index('2015')
      it { expect(stats_analyzer.find_min_per_year).to eq 49.7 }
    end

    context 'avr_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.avr_per_region).to eq 68.82 }
    end

    context 'avr_per_year' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_year_index('2015')
      it { expect(stats_analyzer.avr_per_year).to eq 67.35 }
    end

    context 'c_s_v_per_region' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_region_index('Perm region')
      it { expect(stats_analyzer.c_s_v_per_region(68.82)).to eq 25.62 }
    end

    context 'c_s_v_per_year' do
      reader = Reader.new
      stats_analyzer = StatsAnalyzer.new(reader)
      stats_analyzer.find_year_index('2015')
      it { expect(stats_analyzer.c_s_v_per_year(67.35)).to eq 40.54 }
    end
  end
end

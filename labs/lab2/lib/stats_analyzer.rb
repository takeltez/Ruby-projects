class StatsAnalyzer
  attr_accessor :reg_index

  def initialize(reader)
    @reader = reader
    @reg_index = -1
    @reg_array = []
    (1...@reader.n).each do |i|
      @reg_array[i] = (@reader.csv_array[i][0])
    end
  end

  def find_region_index(region)
    @reg_index = @reg_array.rindex(region)

    puts("Region not found!\n\n") if @reg_index.nil?

    @reg_index
  end

  def find_max_per_region
    @reader.csv_array[@reg_index][1..@reader.csv_array[@reg_index].length].max { |a, b| a.to_f <=> b.to_f }.to_f
  end

  def find_min_per_region
    @reader.csv_array[@reg_index][1..@reader.csv_array[@reg_index].length].min { |a, b| a.to_f <=> b.to_f }.to_f
  end

  def avr_per_region
    sum = @reader.csv_array[@reg_index][1..@reader.csv_array[@reg_index].length].inject { |x, n| x.to_f + n.to_f }
    (sum / (@reader.m - 1)).round(2)
  end

  def c_s_v_per_region(avr_val)
    arr = @reader.csv_array[@reg_index][1..@reader.csv_array[@reg_index].length].map { |x| (x.to_f - avr_val)**2 }
    sum = arr.inject { |x, n| x + n }
    (sum / (@reader.m - 2)).round(2)
  end
end

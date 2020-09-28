class StatsAnalyzer
  attr_accessor :reg_index, :year_index

  def initialize(reader)
    @reader = reader
    @reg_index = -1
    @year_index = -1
  end

  def find_region_index(region)
    (1...@reader.n).each do |i|
      if @reader.csv_array[i][0] == region
        @reg_index = i
        break
      end
    end

    return unless @reg_index == -1

    puts('Region not found!')
    exit
  end

  def find_year_index(year)
    (2...@reader.m).each do |j|
      if @reader.csv_array[0][j] == year
        @year_index = j
        break
      end
    end

    return unless @year_index == -1

    puts('Year not found!')
    exit
  end

  def find_max_per_region
    start_index = -1
    max = 0
    (2...@reader.m).each do |i|
      next if @reader.csv_array[@reg_index][i].instance_of? NilClass

      max = @reader.csv_array[@reg_index][i].to_f
      start_index = i
      break
    end

    ((start_index + 1)...@reader.m).each do |j|
      next if @reader.csv_array[@reg_index][j].instance_of? NilClass

      max = @reader.csv_array[@reg_index][j].to_f if @reader.csv_array[@reg_index][j].to_f > max
    end

    max
  end

  def find_max_per_year
    start_index = -1
    max = 0
    (1...@reader.n).each do |i|
      next if @reader.csv_array[i][@year_index].instance_of? NilClass

      max = @reader.csv_array[i][@year_index].to_f
      start_index = i
      break
    end

    ((start_index + 1)...@reader.n).each do |j|
      next if @reader.csv_array[j][@year_index].instance_of? NilClass

      max = @reader.csv_array[j][@year_index].to_f if @reader.csv_array[j][@year_index].to_f > max
    end

    max
  end

  def find_min_per_region
    start_index = -1
    min = 0
    (2...@reader.m).each do |i|
      next if @reader.csv_array[@reg_index][i].instance_of? NilClass

      min = @reader.csv_array[@reg_index][i].to_f
      start_index = i
      break
    end

    ((start_index + 1)...@reader.m).each do |j|
      next if @reader.csv_array[@reg_index][j].instance_of? NilClass

      min = @reader.csv_array[@reg_index][j].to_f if @reader.csv_array[@reg_index][j].to_f < min
    end

    min
  end

  def find_min_per_year
    start_index = -1
    min = 0
    (1...@reader.n).each do |i|
      next if @reader.csv_array[i][@year_index].instance_of? NilClass

      min = @reader.csv_array[i][@year_index].to_f
      start_index = i
      break
    end

    ((start_index + 1)...@reader.n).each do |j|
      next if @reader.csv_array[j][@year_index].instance_of? NilClass

      min = @reader.csv_array[j][@year_index].to_f if @reader.csv_array[j][@year_index].to_f < min
    end

    min
  end

  def avr_per_region
    avr_val = 0
    count = 0

    (2...@reader.m).each do |j|
      next if @reader.csv_array[@reg_index][j].instance_of? NilClass

      avr_val += @reader.csv_array[@reg_index][j].to_f
      count += 1
    end

    (avr_val / count).round(2)
  end

  def avr_per_year
    avr_val = 0
    count = 0

    (1...@reader.n).each do |i|
      next if @reader.csv_array[i][@year_index].instance_of? NilClass

      avr_val += @reader.csv_array[i][@year_index].to_f
      count += 1
    end

    (avr_val / count).round(2)
  end

  def c_s_v_per_region(avr_val)
    count = 0
    sum = 0

    (2...@reader.m).each do |j|
      next if @reader.csv_array[@reg_index][j].instance_of? NilClass

      sum += (@reader.csv_array[@reg_index][j].to_f - avr_val)**2
      count += 1
    end

    (sum / (count - 1)).round(2)
  end

  def c_s_v_per_year(avr_val)
    count = 0
    sum = 0

    (1...@reader.n).each do |i|
      next if @reader.csv_array[i][@year_index].instance_of? NilClass

      sum += (@reader.csv_array[i][@year_index].to_f - avr_val)**2
      count += 1
    end

    (sum / (count - 1)).round(2)
  end
end

require 'csv'

class Reader
  attr_accessor :csv_array, :n, :m

  def initialize
    @csv_array = CSV.read('lib/res/internet_using.csv')

    @n = csv_array.length
    @m = csv_array[0].length
  end

  def print_csv
    (0...@n).each do |i|
      (0...@m).each do |j|
        print("#{@csv_array[i][j]},")
      end
      puts("\n")
    end
  end
end

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

class StartProg
  def initialize(stats_analyzer)
    @stats_analyzer = stats_analyzer
  end

  def start
    print('Coose statistic mode(region/year): ')

    mode = gets.chomp

    if (mode != 'region') && (mode != 'year')
      puts('Incorrect mode!')
      exit
    end

    case mode

    when 'region'
      print('Choose region of RF: ')

      region = gets.chomp

      @stats_analyzer.find_region_index(region)

      max_per_reg = @stats_analyzer.find_max_per_region
      min_per_reg = @stats_analyzer.find_min_per_region
      avr_val_per_reg = @stats_analyzer.avr_per_region
      c_s_var_per_reg = @stats_analyzer.c_s_v_per_region(avr_val_per_reg)

      puts("Max: #{max_per_reg}\nMin: #{min_per_reg}\nX_avr: #{avr_val_per_reg}\nS^2: #{c_s_var_per_reg}")

    when 'year'
      print('Choose year[2013-2019]: ')

      year = gets.chomp

      @stats_analyzer.find_year_index(year)

      max_per_year = @stats_analyzer.find_max_per_year
      min_per_year = @stats_analyzer.find_min_per_year
      avr_val_per_year = @stats_analyzer.avr_per_year
      c_s_var_per_year = @stats_analyzer.c_s_v_per_year(avr_val_per_year)

      puts("Max: #{max_per_year}\nMin: #{min_per_year}\nX_avr: #{avr_val_per_year}\nS^2: #{c_s_var_per_year}")
    end
  end
end

reader = Reader.new
stats_analyzer = StatsAnalyzer.new(reader)
start_prog = StartProg.new(stats_analyzer)

start_prog.start

require 'csv'
require_relative 'reader'
require_relative 'stats_analyzer'

class Adapter
  def start
    reader = Reader.new
    stats_analyzer = StatsAnalyzer.new(reader)

    loop do
      print('Choose statistic mode(region/year/exit): ')

      mode = gets.chomp

      exit if mode == 'exit'

      case mode

      when 'region'
        print('Choose region of RF: ')

        region = gets.chomp

        if stats_analyzer.find_region_index(region) == false
          puts("Region not found!\n\n")
          next
        end

        max_per_reg = stats_analyzer.find_max_per_region
        min_per_reg = stats_analyzer.find_min_per_region
        avr_val_per_reg = stats_analyzer.avr_per_region
        c_s_var_per_reg = stats_analyzer.c_s_v_per_region(avr_val_per_reg)

        puts("\nMax: #{max_per_reg}\nMin: #{min_per_reg}\nX_avr: #{avr_val_per_reg}\nS^2: #{c_s_var_per_reg}\n\n")

      when 'year'
        print('Choose year[2013-2019]: ')

        year = gets.chomp

        if stats_analyzer.find_year_index(year) == false
          puts("Year not found!\n\n")
          next
        end

        max_per_year = stats_analyzer.find_max_per_year
        min_per_year = stats_analyzer.find_min_per_year
        avr_val_per_year = stats_analyzer.avr_per_year
        c_s_var_per_year = stats_analyzer.c_s_v_per_year(avr_val_per_year)

        puts("\nMax: #{max_per_year}\nMin: #{min_per_year}\nX_avr: #{avr_val_per_year}\nS^2: #{c_s_var_per_year}\n\n")

      else
        puts("Incorrect mode!\n\n")
      end
    end
  end
end

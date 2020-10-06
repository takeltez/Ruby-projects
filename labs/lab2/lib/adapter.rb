require 'csv'
require_relative 'reader'
require_relative 'stats_analyzer'

class Adapter
  def start
    @reader = Reader.new
    @stats_analyzer = StatsAnalyzer.new(@reader)
    loop do
      print('Choose(start/exit): ')

      mode = gets.chomp

      exit if mode == 'exit'

      case mode

      when 'start'
        print('Choose region of RF: ')

        @region = gets.chomp

        next if check == false

        calling_methods

      else
        puts("Incorrect mode!\n\n")
      end
    end
  end

  def calling_methods
    max_per_reg = @stats_analyzer.find_max_per_region
    min_per_reg = @stats_analyzer.find_min_per_region
    avr_val_per_reg = @stats_analyzer.avr_per_region
    c_s_var_per_reg = @stats_analyzer.c_s_v_per_region(avr_val_per_reg)

    puts("\nMax: #{max_per_reg}\nMin: #{min_per_reg}\nX_avr: #{avr_val_per_reg}\nS^2: #{c_s_var_per_reg}\n\n")
  end

  def check
    if @stats_analyzer.find_region_index(@region).nil?
      puts("Region not found!\n\n")
      false
    else
      true
    end
  end
end

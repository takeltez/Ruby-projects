class Convertor
  def convert; end
end

class Reader
  attr_accessor :temperature, :in_degree_type, :out_degree_type

  def read
    print('Enter temperature: ')
    @temperature = gets.chomp

    print('Enter incoming degree type (C, K, F): ')
    @in_degree_type = gets.chomp.upcase

    print('Enter outgoing degree type (C, K, F): ')
    @out_degree_type = gets.chomp.upcase
  end

  def check_temperature
    if @temperature[/[a-zA-Z_]/]
      puts("\nTemperature must be a numeric value: #{@temperature}")
      exit
    else
      @temperature = @temperature.to_f
    end
  end

  def check_in_degree_type
    return unless (@in_degree_type != 'C') && (@in_degree_type != 'K') && (@in_degree_type != 'F')

    puts("\nIncorrect degree type: #{@in_degree_type}")
    exit
  end

  def check_out_degree_type
    return unless (@out_degree_type != 'C') && (@out_degree_type != 'K') && (@out_degree_type != 'F')

    puts("\nIncorrect degree type: #{@out_degree_type}")
    exit
  end
end

class Adapter < Convertor
  def initialize(reader)
    @reader = reader
    super()
  end

  def convert
    case @reader.in_degree_type
    when 'C'
      from_c
    when 'K'
      from_k
    when 'F'
      from_f
    end
  end

  def from_c
    case @reader.out_degree_type
    when 'C'
      [@reader.temperature.round(2), @reader.out_degree_type]
    when 'K'
      [(@reader.temperature + 273).round(2), @reader.out_degree_type]
    when 'F'
      [(@reader.temperature * 1.8 + 32).round(2), @reader.out_degree_type]
    end
  end

  def from_k
    case @reader.out_degree_type
    when 'C'
      [(@reader.temperature - 273).round(2), @reader.out_degree_type]
    when 'K'
      [@reader.temperature.round(2), @reader.out_degree_type]
    when 'F'
      [(@reader.temperature * 1.8 - 459).round(2), @reader.out_degree_type]
    end
  end

  def from_f
    case @reader.out_degree_type
    when 'C'
      [((@reader.temperature - 32) / 1.8).round(2), @reader.out_degree_type]
    when 'K'
      [((@reader.temperature + 459) / 1.8).round(2), @reader.out_degree_type]
    when 'F'
      [@reader.temperature.round(2), @reader.out_degree_type]
    end
  end
end

reader = Reader.new

reader.read

reader.check_temperature
reader.check_in_degree_type
reader.check_out_degree_type

adapter = Adapter.new(reader)

degree = adapter.convert

puts("\nTemperature (#{degree[1]}): #{degree[0]}")

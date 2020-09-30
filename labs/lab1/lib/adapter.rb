require_relative 'converter'
require_relative 'reader'

class Adapter < Converter
  def start
    reader = Reader.new

    loop do
      reader.read

      if reader.check_temperature == false
        puts("\nTemperature must be numeric value!\n\n")
        next
      end

      if reader.check_in_degree_type == false || reader.check_out_degree_type == false
        puts("\nIncorrect scale!\n\n")
        next
      end

      degree = convert(reader.temperature, reader.in_degree_type, reader.out_degree_type)

      puts("\nTemperature (#{degree[1]}): #{degree[0]}\n\n")
    end
  end
end

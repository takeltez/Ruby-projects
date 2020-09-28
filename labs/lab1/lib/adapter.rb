require_relative 'converter'
require_relative 'reader'

class Adapter < Converter
  def start
    reader = Reader.new

    reader.read

    tempr = reader.temperature
    in_sclale = reader.in_degree_type
    out_scale = reader.out_degree_type

    reader.check_temperature
    reader.check_in_degree_type
    reader.check_out_degree_type

    degree = convert(tempr, in_sclale, out_scale)

    puts("\nTemperature (#{degree[1]}): #{degree[0]}")
  end
end

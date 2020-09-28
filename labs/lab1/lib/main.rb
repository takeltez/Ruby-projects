require_relative 'converter'
require_relative 'reader'
require_relative 'adapter'

class Main
  def main
    reader = Reader.new

    reader.read

    reader.check_temperature
    reader.check_in_degree_type
    reader.check_out_degree_type

    adapter = Adapter.new(reader)

    degree = adapter.convert

    puts("\nTemperature (#{degree[1]}): #{degree[0]}")
  end
end

start = Main.new
start.main

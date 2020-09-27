class Convertor
	 def convert
 	end
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

 		if @temperature[/[a-zA-Z_]/]
 
 			puts("\nTemperature must be a numeric value: #{@temperature}")
 			exit
 		else
 			@temperature = @temperature.to_f
 		end

 		if (@in_degree_type != 'C') && (@in_degree_type != 'K') && (@in_degree_type != 'F')
 
 			puts("\nIncorrect degree type: #{@in_degree_type}")
 			exit
 
 		end

 		if (@out_degree_type != 'C') && (@out_degree_type != 'K') && (@out_degree_type != 'F')
 
 			puts("\nIncorrect degree type: #{@out_degree_type}")
 			exit
 
 		end
 	end
end

class Adapter < Convertor
	 def initialize(reader)
 		@reader = reader
 	end

	 def convert
 		case (@reader.in_degree_type)
   when ('C')
 				case (@reader.out_degree_type)
     when ('C')
 						[@reader.temperature, @reader.out_degree_type]
     when ('K')
 						(@reader.temperature + 273), @reader.out_degree_type
     when ('F')
 						(@reader.temperature * 1.8 + 32), @reader.out_degree_type
 				end
   when ('K')
 				case (@reader.out_degree_type)
     when ('C')
 						(@reader.temperature - 273), @reader.out_degree_type
     when ('K')
 						[@reader.temperature, @reader.out_degree_type]
     when ('F')
 						(@reader.temperature * 1.8 - 459), @reader.out_degree_type
 				end
   when ('F')
 				case (@reader.out_degree_type)
     when ('C')
 						((@reader.temperature - 32) / 1.8), @reader.out_degree_type
     when ('K')
 						((@reader.temperature + 459) / 1.8), @reader.out_degree_type
     when ('F')
 						[@reader.temperature, @reader.out_degree_type]
 				end
 		end
 	end
end

reader = Reader.new

reader.read

adapter = Adapter.new(reader)

degree = adapter.convert

puts("\nTemperature (#{degree[1]}): #{degree[0].round(2)}")

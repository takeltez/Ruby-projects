require 'csv'

class Reader

	attr_accessor :csv_array

	def initialize()

		@csv_array = CSV.read("res/internet_using.csv")

		$n = csv_array.length()
		$m = csv_array[0].length()
	
	end

	def printCSV()

		for i in 0...$n
			for j in 0...$m
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

	def findRegionIndex(region)

		for i in 1...$n
			if (@reader.csv_array()[i][0] == region)
				@reg_index = i
				break
			end
		end

		if (@reg_index == -1)
			puts("Region not found!")
			exit()
		end
	end

	def findYearIndex(year)

		for j in 2...$m
			if (@reader.csv_array()[0][j] == year)
				@year_index = j
				break
			end
		end

		if (@year_index == -1)
			puts("Year not found!")
			exit()
		end
	end

	def findMaxPerRegion()

 		for i in 2...$m
 			if (@reader.csv_array()[@reg_index][i].instance_of? NilClass)
				next
			else
				max = @reader.csv_array()[@reg_index][i].to_f()		
				break
			end
 		end
 
 		if (i == $m)
 			return nil
 		end

		for j in (i + 1)...$m
			if (@reader.csv_array()[@reg_index][j].instance_of? NilClass)
				next
			end
			if (@reader.csv_array()[@reg_index][j].to_f() > max)
				max = @reader.csv_array()[@reg_index][j].to_f()
			end
		end

		return max
	end

	def findMaxPerYear()

 		for i in 1...$n
 			if (@reader.csv_array()[i][@year_index].instance_of? NilClass)
				next
			else
				max = @reader.csv_array()[i][@year_index].to_f()
				break
			end
 		end
 
 		if (i == $n)
 			return nil
 		end

		for j in (i + 1)...$n
			if (@reader.csv_array()[j][@year_index].instance_of? NilClass)
				next
			end
			if (@reader.csv_array()[j][@year_index].to_f() > max)
				max = @reader.csv_array()[j][@year_index].to_f()
			end
		end

		return max
	end

	def findMinPerRegion()

		for i in 2...$m
 			if (@reader.csv_array()[@reg_index][i].instance_of? NilClass)
				next
			else
				min = @reader.csv_array()[@reg_index][i].to_f()
				break
			end
 		end
 
 		if (i == $m)
 			return nil
 		end

		for j in (i + 1)...$m 
			if (@reader.csv_array()[@reg_index][j].instance_of? NilClass)
				next
			end
			if (@reader.csv_array()[@reg_index][j].to_f() < min)
				min = @reader.csv_array()[@reg_index][j].to_f()
			end
		end

		return min
	end

	def findMinPerYear()

		for i in 1...$n
 			if (@reader.csv_array()[i][@year_index].instance_of? NilClass)
				next
			else
				min = @reader.csv_array()[i][@year_index].to_f()
				break
			end
 		end
 
 		if (i == $n)
 			return nil
 		end

		for j in (i + 1)...$n 
			if (@reader.csv_array()[j][@year_index].instance_of? NilClass)
				next
			end
			if (@reader.csv_array()[j][@year_index].to_f() < min)
				min = @reader.csv_array()[j][@year_index].to_f()
			end
		end

		return min
	end

	def AvrPerRegion()

		avr_val = 0
		count = 0

		for j in 2...$m
			if (@reader.csv_array()[@reg_index][j].instance_of? NilClass)
				next
			end
			avr_val += @reader.csv_array()[@reg_index][j].to_f()
			count += 1
		end

		return (avr_val / count).round(2)
	end

	def AvrPerYear()

		avr_val = 0
		count = 0

		for i in 1...$n
			if (@reader.csv_array()[i][@year_index].instance_of? NilClass)
				next
			end
			avr_val += @reader.csv_array()[i][@year_index].to_f()
			count += 1
		end

		return (avr_val / count).round(2)
	end

	def CSVariancePerRegion(avr_val)

		count = 0
		sum = 0

		for j in 2...$m
			if (@reader.csv_array()[@reg_index][j].instance_of? NilClass)
				next
			end
			sum += (@reader.csv_array()[@reg_index][j].to_f() - avr_val) ** 2 
			count += 1
		end

		return (sum / (count - 1)).round(2)
	end

	def CSVariancePerYear(avr_val)

		count = 0
		sum = 0

		for i in 1...$n
			if (@reader.csv_array()[i][@year_index].instance_of? NilClass)
				next
			end
			sum += (@reader.csv_array()[i][@year_index].to_f() - avr_val) ** 2 
			count += 1
		end

		return (sum / (count - 1)).round(2)
	end
end

class StartProg

	def initialize(stats_analyzer)

		@stats_analyzer = stats_analyzer
	end

	def start()

		print("Coose statistic mode(region/year): ")

		mode = gets().chomp()

		if (mode != "region" and mode != "year")
			puts("Incorrect mode!")
			exit()
		end

		case(mode)

			when("region")
				print("Choose region of RF: ")

				region = gets().chomp()

				@stats_analyzer.findRegionIndex(region)

				max_per_reg = @stats_analyzer.findMaxPerRegion()
				min_per_reg = @stats_analyzer.findMinPerRegion()
				avr_val_per_reg = @stats_analyzer.AvrPerRegion()
				c_s_var_per_reg = @stats_analyzer.CSVariancePerRegion(avr_val_per_reg)

				puts ("Max: #{max_per_reg}\nMin: #{min_per_reg}\nX_avr: #{avr_val_per_reg}\nS^2: #{c_s_var_per_reg}")

			when("year")
				print("Choose year[2013-2019]: ")

				year = gets().chomp()

				@stats_analyzer.findYearIndex(year)

				max_per_year = @stats_analyzer.findMaxPerYear()
				min_per_year = @stats_analyzer.findMinPerYear()
				avr_val_per_year = @stats_analyzer.AvrPerYear()
				c_s_var_per_year = @stats_analyzer.CSVariancePerYear(avr_val_per_year)
			
				puts ("Max: #{max_per_year}\nMin: #{min_per_year}\nX_avr: #{avr_val_per_year}\nS^2: #{c_s_var_per_year}")
		end
	end
end

reader = Reader.new()
stats_analyzer = StatsAnalyzer.new(reader)
start_prog = StartProg.new(stats_analyzer)

start_prog.start()



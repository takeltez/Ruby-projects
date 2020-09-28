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

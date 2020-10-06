class Reader
  attr_accessor :data_array, :n, :m, :regions

  def initialize
    @data_array = CSV.read('lib/res/internet_using.csv')

    @n = @data_array.length
    @m = @data_array[0].length

    @regions = []
    (1...@n).each do |i|
      @regions[i] = (@data_array[i][0])
    end
  end
end

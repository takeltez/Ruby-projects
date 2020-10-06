class Reader
  attr_accessor :csv_array, :n, :m

  def initialize
    @csv_array = CSV.read('lib/res/internet_using.csv')

    @n = csv_array.length
    @m = csv_array[0].length
  end
end

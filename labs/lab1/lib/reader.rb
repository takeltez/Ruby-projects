class Reader
  attr_accessor :temperature, :in_degree_type, :out_degree_type

  def read
    print('Enter \'exit\' for stop or any key for continue: ')

    stop = gets.chomp

    exit if stop == 'exit'

    print("\nEnter temperature: ")
    @temperature = gets.chomp

    print('Enter incoming degree type (C, K, F): ')
    @in_degree_type = gets.chomp.upcase

    print('Enter outgoing degree type (C, K, F): ')
    @out_degree_type = gets.chomp.upcase
  end

  def check_temperature
    return unless @temperature[/[a-zA-Z_]/]

    false
  end

  def check_in_degree_type
    return unless (@in_degree_type != 'C') && (@in_degree_type != 'K') && (@in_degree_type != 'F')

    false
  end

  def check_out_degree_type
    return unless (@out_degree_type != 'C') && (@out_degree_type != 'K') && (@out_degree_type != 'F')

    false
  end
end

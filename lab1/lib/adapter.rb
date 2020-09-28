class Adapter < Converter
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
      from_c_to_k
    when 'F'
      from_c_to_f
    end
  end

  def from_k
    case @reader.out_degree_type
    when 'C'
      from_k_to_c
    when 'K'
      [@reader.temperature.round(2), @reader.out_degree_type]
    when 'F'
      from_k_to_f
    end
  end

  def from_f
    case @reader.out_degree_type
    when 'C'
      from_f_to_c
    when 'K'
      from_f_to_k
    when 'F'
      [@reader.temperature.round(2), @reader.out_degree_type]
    end
  end

  def from_c_to_k
    [(@reader.temperature + 273).round(2), @reader.out_degree_type]
  end

  def from_c_to_f
    [(@reader.temperature * 1.8 + 32).round(2), @reader.out_degree_type]
  end

  def from_k_to_c
    [(@reader.temperature - 273).round(2), @reader.out_degree_type]
  end

  def from_k_to_f
    [(@reader.temperature * 1.8 - 459).round(2), @reader.out_degree_type]
  end

  def from_f_to_c
    [((@reader.temperature - 32) / 1.8).round(2), @reader.out_degree_type]
  end

  def from_f_to_k
    [((@reader.temperature + 459) / 1.8).round(2), @reader.out_degree_type]
  end
end

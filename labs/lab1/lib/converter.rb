class Converter
  def convert(tempr, in_sclale, out_scale)
    case in_sclale
    when 'C'
      from_c(tempr, out_scale)
    when 'K'
      from_k(tempr, out_scale)
    when 'F'
      from_f(tempr, out_scale)
    end
  end

  def from_c(tempr, out_scale)
    case out_scale
    when 'C'
      [tempr.to_f.round(2), out_scale]
    when 'K'
      from_c_to_k(tempr, out_scale)
    when 'F'
      from_c_to_f(tempr, out_scale)
    end
  end

  def from_k(tempr, out_scale)
    case out_scale
    when 'C'
      from_k_to_c(tempr, out_scale)
    when 'K'
      [tempr.to_f.round(2), out_scale]
    when 'F'
      from_k_to_f(tempr, out_scale)
    end
  end

  def from_f(tempr, out_scale)
    case out_scale
    when 'C'
      from_f_to_c(tempr, out_scale)
    when 'K'
      from_f_to_k(tempr, out_scale)
    when 'F'
      [tempr.to_f.round(2), out_scale]
    end
  end

  def from_c_to_k(tempr, out_scale)
    [(tempr.to_f + 273).round(2), out_scale]
  end

  def from_c_to_f(tempr, out_scale)
    [(tempr.to_f * 1.8 + 32).round(2), out_scale]
  end

  def from_k_to_c(tempr, out_scale)
    [(tempr.to_f - 273).round(2), out_scale]
  end

  def from_k_to_f(tempr, out_scale)
    [(tempr.to_f * 1.8 - 459).round(2), out_scale]
  end

  def from_f_to_c(tempr, out_scale)
    [((tempr.to_f - 32) / 1.8).round(2), out_scale]
  end

  def from_f_to_k(tempr, out_scale)
    [((tempr.to_f + 459) / 1.8).round(2), out_scale]
  end
end

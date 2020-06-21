class Enum
  def self.values
    constants.map { |const| self.const_get(const) }
  end

  def self.all
    values
  end

  def self.include?(value)
    all.include?(value)
  end
end

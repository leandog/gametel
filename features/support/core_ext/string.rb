class String
  def to_class
    Object.const_get(self)
  end
end

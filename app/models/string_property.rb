class StringProperty < Property
  belongs_to :thing
  before_save :determine_input
private
  def determine_input
    self.input = 'string'
  end
end

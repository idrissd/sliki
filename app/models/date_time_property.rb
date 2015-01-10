class DateTimeProperty < Property
  belongs_to :thing
  private
    def determine_input
      self.input = 'date'
    end
end

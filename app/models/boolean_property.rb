class BooleanProperty < Property
  belongs_to :thing
  private
    def determine_input
      self.input = 'boolean'
    end
end

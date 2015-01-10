class FileProperty < Property
  belongs_to :thing
  private
    def determine_input
      self.input = 'file'
    end
end

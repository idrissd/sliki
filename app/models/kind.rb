class Kind < AbstractPage
  belongs_to :thing
  store :values
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_paper_trail

  def machine
    kind = self
    @machine ||= Machine.new(kind, :initial => :new) do
      kind.thing.transitions.each do |t|
        transition({t.from_state.to_sym => t.to_state.to_sym, :on => t.on_event.to_sym})
      end
      after_transition do
        if Class.const_defined? kind.name.parameterize("_").classify
          kind.name.parameterize("_").classify.constantize.perform_async(kind.id)
        end
        kind.state = kind.machine.state
        kind.save
      end
    end
  end

end

class Machine
  def self.new(object, *args, &block)
    machine = Class.new do
      def definition
        self.class.state_machine
      end
    end
    machine.state_machine(*args, &block)
    machine.new
  end
end

class MyKind
  include Sidekiq::Worker

  def perform(kind)
    puts "Doing hard work on #{kind}"
  end
end
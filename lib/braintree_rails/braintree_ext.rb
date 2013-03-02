[Braintree::Plan, Braintree::Modification].each do |model|
  model.class_eval do
   def self.find(id)
     all.find {|plan| plan.id == id}
   end
  end
end

module Braintree
  class Descriptor
    def ==(other)
      return false unless other.is_a?(Descriptor)
      name == other.name && phone == other.phone
    end
  end
end
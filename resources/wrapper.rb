def initialize(*args)
    super
    @action = :create
end

actions :create

attribute :ruby_string, :kind_of => String, :name_attribute => true
attribute :gemset, :kind_of => String

module RubygemsDatabase
  class Base < ApplicationRecord
    self.abstract_class = true

    connects_to database: { writing: :rubygems, reading: :rubygems }
  end
end

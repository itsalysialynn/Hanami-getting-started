require 'spec_helper'

describe Lending do
  it 'can be initialized with attributes' do
    lending = Lending.new(title: 'Refactoring')
    lending.title.must_equal 'Refactoring'
  end
end

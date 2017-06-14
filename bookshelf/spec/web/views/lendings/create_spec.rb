require 'spec_helper'
require_relative '../../../../apps/web/views/lendings/create'

describe Web::Views::Lendings::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/lendings/create.html.erb') }
  let(:view)      { Web::Views::Lendings::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end

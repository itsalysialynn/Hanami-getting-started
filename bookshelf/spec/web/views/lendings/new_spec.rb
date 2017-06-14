require 'spec_helper'
require 'ostruct'
require_relative '../../../../apps/web/views/lendings/new'

describe Web::Views::Lendings::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'First Name must be filled', 'Last Name must be filled', 'Address must be filled', 'Phone must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/lendings/new.html.erb') }
  let(:view)      { Web::Views::Lendings::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title must be filled')
    rendered.must_include('First Name must be filled')
    rendered.must_include('Last Name must be filled')
    rendered.must_include('Address must be filled')
    rendered.must_include('Phone must be filled')
  end
end
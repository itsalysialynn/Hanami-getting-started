require 'spec_helper'
require_relative '../../../../apps/web/controllers/lendings/new'

describe Web::Controllers::Lendings::New do
  let(:action) { Web::Controllers::Lendings::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

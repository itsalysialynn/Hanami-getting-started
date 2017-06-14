require 'spec_helper'
require_relative '../../../../apps/web/controllers/lendings/index'

describe Web::Controllers::Lendings::Index do
  let(:action) { Web::Controllers::Lendings::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/authors'

describe Web::Controllers::Books::Authors do
  let(:action) { Web::Controllers::Books::Authors.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

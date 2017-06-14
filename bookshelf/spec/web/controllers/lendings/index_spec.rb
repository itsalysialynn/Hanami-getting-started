require 'spec_helper'
require_relative '../../../../apps/web/controllers/lendings/index'

describe Web::Controllers::Lendings::Index do
  let(:action) { Web::Controllers::Lendings::Index.new }
  let(:params) { Hash[] }
  let(:repository) { LendingRepository.new }

  before do
    repository.clear

    @lending = repository.create(title: 'TDD', first_name: 'Kent', last_name: 'Beck', address: '123 No St', phone: '778-555-5555')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all lendings' do
    action.call(params)
    action.exposures[:lendings].must_equal [@lending]
  end
end

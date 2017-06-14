require 'spec_helper'
require_relative '../../../../apps/web/controllers/lendings/create'

describe Web::Controllers::Lendings::Create do
  let(:action) { Web::Controllers::Lendings::Create.new }
  let(:repository) { LendingRepository.new }

  before do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[lending: { title: 'I wrote this', first_name: 'Kelly', last_name: 'Clarke', address: '123 Fake St', phone: '555-555-5555'}] }

    it 'creates a lending' do
      action.call(params)
      lending = repository.last

      lending.id.wont_be_nil
      lending.title.must_equal params.dig(:lending, :title)
      lending.first_name.must_equal params.dig(:lending, :first_name)
      lending.last_name.must_equal params.dig(:lending, :last_name)
      lending.address.must_equal params.dig(:lending, :address)
      lending.phone.must_equal params.dig(:lending, :phone)
    end

    it 'redirects the user to the lendings listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/lendings'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[lending: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:lending, :title).must_equal      ['is missing']
      errors.dig(:lending, :first_name).must_equal ['is missing']
      errors.dig(:lending, :last_name).must_equal  ['is missing']
      errors.dig(:lending, :address).must_equal    ['is missing']
      errors.dig(:lending, :phone).must_equal      ['is missing']
    end
  end
end

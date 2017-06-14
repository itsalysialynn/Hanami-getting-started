require 'spec_helper'
require_relative '../../../../apps/web/views/lendings/index'

describe Web::Views::Lendings::Index do
  let(:exposures) { Hash[lendings: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/lendings/index.html.erb') }
  let(:view)      { Web::Views::Lendings::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #lendings' do
    view.lendings.must_equal exposures.fetch(:lendings)
  end

  describe 'when there are no lendings' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">No books being lent out yet.</p>')
    end
  end

  describe 'when there are lendings' do
    let(:lending1)  { Lending.new(title: 'I wrote this', first_name: 'Kelly', last_name: 'Clarke', address: '123 Fake St', phone: '555-555-5555') }
    let(:lending2)  { Lending.new(title: 'SQL for Dummies', first_name: 'Jack', last_name: 'Jones', address: '123 Not Real Rd', phone: '777-555-5555') } 
    let(:exposures) { Hash[lendings: [lending1, lending2]] }

    it 'lists them all' do
      rendered.scan(/class="lending"/).count.must_equal 2
      rendered.must_include('123 Fake St')
      rendered.must_include('123 Not Real Rd')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">No books being lent out yet.</p>')
    end
  end
end

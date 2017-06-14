require 'spec_helper'
require_relative '../../../../apps/web/views/books/authors'

describe Web::Views::Books::Authors do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/authors.html.erb') }
  let(:view)      { Web::Views::Books::Authors.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes books#authors' do
    view.books.must_equal exposures.fetch(:books)
  end

  describe 'when there are no authors' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no authors yet.</p>')
    end
  end

  describe 'when there are books' do
    let(:book1)     { Book.new(title: 'I wrote this', author: 'Jack Jones') }
    let(:book2)     { Book.new(title: 'SQL for Dummies', author: 'Eric Edward') }
    let(:exposures) { Hash[books: [book1, book2]] }

    it 'lists them all' do
      rendered.scan(/class="author"/).count.must_equal 2
      rendered.must_include('Jack Jones')
      rendered.must_include('Eric Edward')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no authors yet.</p>')
    end
  end
end

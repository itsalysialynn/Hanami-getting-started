module Web::Controllers::Lendings
  class Index
    include Web::Action

    expose :lendings

    def call(params)
      @lendings = LendingRepository.new.all
    end
  end
end

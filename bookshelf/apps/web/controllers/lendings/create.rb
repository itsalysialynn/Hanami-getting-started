module Web::Controllers::Lendings
  class Create
    include Web::Action

    expose :lending

    params do
      required(:lending).schema do
        required(:title).filled(:str?)
        required(:first_name).filled(:str?)
        required(:last_name).filled(:str?)
        required(:address).filled(:str?)
        required(:phone).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @lending = LendingRepository.new.create(params[:lending])

        redirect_to '/lendings'
      else
        self.status = 422
      end
    end
  end
end

module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      require "pry"; binding.pry
    end
  end
end

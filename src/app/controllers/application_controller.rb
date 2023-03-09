class ApplicationController < ActionController::API
    def sample
        render json:{status:'SUCCESS', msg: "Great!"}
    end
end

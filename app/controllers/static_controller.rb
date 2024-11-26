class StaticController < ApplicationController

    def home
        render json: {Status: "Hey HQ GN Fanatics"}
    end

end
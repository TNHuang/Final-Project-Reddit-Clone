class Api::RootController < ApplicationController
  def root
    redirect_to "root#root"
  end
end

class SessionsController < ApplicationController
  def new
    render layout: 'template/layout_login'
  end
end

class HomesController < ApplicationController
  def top
  end

  def about
    @seniors= Senior.all
  end
end

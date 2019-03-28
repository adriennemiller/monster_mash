class BeautyContestsController < ApplicationController

  def new

  end
  
  def show
      @contest = BeautyContest.find(params[:id])
  end
end

class MonstersController < ApplicationController
  before_action :get_monster, only: [:show, :create, :edit, :destroy]

  def index
    @monsters = Monster.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def monster_params
    params.require(:monster).permit!
  end

  def get_monster
    @monster = Monster.find(params[:id])
  end
end

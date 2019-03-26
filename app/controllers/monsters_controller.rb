class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :create, :edit, :update, :destroy]
  before_action :set_body_parts, only: [:new, :edit]

  def index
    @monsters = Monster.all
  end

  def show
  end

  def new
    @monster = Monster.new
  end

  def create
  end

  def edit

  end

  def update
    @monster.update(monster_params)
    render :edit
  end

  def destroy
  end

  private

  def monster_params()
    params.require(:monster).permit!
  end

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def set_body_parts
    @heads = BodyPart.where(section: "head")
    @torsos = BodyPart.where(section: "torso")
    @legs = BodyPart.where(section: "leg")
  end
end

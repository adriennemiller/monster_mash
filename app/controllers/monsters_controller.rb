class MonstersController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :home, :show]
  before_action :set_monster, only: [:show, :edit, :update, :destroy]
  before_action :set_body_parts, only: [:new, :edit]


  def index
    @monsters = Monster.all
  end

  def show
    user = User.find_by(id: session[:user_id]) 
    @is_user_owner = user && @monster.user.id == user.id
    @has_user_liked = user && Like.find_by(user_id: user.id, monster_id: @monster.id)
    @monster.update_happiness if @monster.time_last_fed
  end

  def new
    # Default values
    @monster = Monster.new(
      face_id: @faces.select{|face| face.filename.include?("happy")}.sample.id,
      face_x: 400/3,
      face_y: 9,
      face_scale_x: 1.0,
      face_scale_y: 1.0,

      head_id: @heads.sample.id,
      head_x: 400/3,
      head_y: 0,
      head_scale_x: 1.0,
      head_scale_y: 1.0,

      torso_id: @torsos.sample.id,
      torso_x: 400/3,
      torso_y: 360/3,
      torso_scale_x: 1.0,
      torso_scale_y: 1.0,

      leg_id: @legs.sample.id,
      leg_x: 400/3,
      leg_y: 759/3,
      leg_scale_x: 1.0,
      leg_scale_y: 1.0,

      happiness: 10,
      time_last_fed: Time.zone.now
    )
  end


  def create
    user = User.find_by(id: session[:user_id])
    @monster = user.monsters.build(monster_params)

    if @monster.save
      redirect_to @monster
    else
      render :new
    end
  end

  def edit

  end

  def update
    # Update happiness if fed
    @monster.update_happiness if (monster_params[:time_last_fed])

    if @monster.update(monster_params)
      redirect_to @monster
    else
      render :edit
    end
  end

  def destroy
    @monster.destroy
    redirect_to root_path
  end

  def  home
  end

  private

  def monster_params
    params.require(:monster).permit!
  end

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def set_body_parts
    @faces = BodyPart.where(section: "face")
    @heads = BodyPart.where(section: "head")
    @torsos = BodyPart.where(section: "torso")
    @legs = BodyPart.where(section: "leg")
  end
end

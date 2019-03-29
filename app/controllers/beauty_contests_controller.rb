class BeautyContestsController < ApplicationController

  def new
    if current_user && !current_user.is_admin?
      redirect_to root_path
    end

    @contest = BeautyContest.new
  end

  def create
    contest = BeautyContest.create
    redirect_to contest
  end

  def update
    if  params[:beauty_contest][:entry_monster_id]
      Entry.find_or_create_by(
        beauty_contest_id: params[:id],
        monster_id: params[:beauty_contest][:entry_monster_id]
      )
    elsif params[:beauty_contest][:vote_monster_id]
      entry = Entry.find_by(
        beauty_contest_id: params[:id],
        monster_id: params[:beauty_contest][:vote_monster_id]
      )
    elsif params[:beauty_contest][:end_contest] && current_user.is_admin?
      contest = BeautyContest.find_by(id: params[:id])
      contest.update(has_ended: true)
      winner = contest.get_winner
      winner.update(has_won_contest: true)
    end

    redirect_to beauty_contest_path(params[:id])
  end

  def show
    entries = Entry.where(beauty_contest_id: params[:id])
    user_monster_ids = current_user.monsters.map {|monster| monster.id }

    @contest = BeautyContest.find(params[:id])
    @user = current_user
    @has_entered = false
    @is_full = entries.size >= 5
    @monsters = entries.map {|e| Monster.find_by(id: e.monster_id)}

    entries.each do |entry|
      if user_monster_ids.include?(entry.monster_id)
        @has_entered = true
        break
      end
    end
  end
end

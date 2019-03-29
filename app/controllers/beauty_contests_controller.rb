class BeautyContestsController < ApplicationController
  def index
    @contests = BeautyContest.all
    @active_contest = @contests.size > 0 ? @contests.last : nil
  end

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

      vote = Vote.find_or_create_by(user_id: current_user.id)
      vote.update(entry_id: entry.id, user_id: current_user.id)

    elsif params[:beauty_contest][:end_contest] && current_user.is_admin?
      contest = BeautyContest.find_by(id: params[:id])
      contest.update(has_ended: true)
      winner = contest.get_winner
      if (winner)
        winner.update(has_won_contest: true)
      end
    end

    redirect_to beauty_contest_path(params[:id])
  end

  def show
    entries = Entry.where(beauty_contest_id: params[:id])
    user_monster_ids = current_user.monsters.map {|monster| monster.id }

    @contest = BeautyContest.find(params[:id])
    @user = current_user
    @is_full = entries.size >= 5
    @monsters = entries.map {|e| Monster.find_by(id: e.monster_id)}
    @has_entered = false
    @vote_option = nil

    entries.each do |entry|
      if user_monster_ids.include?(entry.monster_id)
        @has_entered = true
        break
      end
    end

    entries.each do |entry| 
      entry.votes.each do |vote|
        if vote.user_id == @user.id
          @vote_option = Monster.find_by(id: vote.entry.monster_id).name
          break
        end
      end
    end
  end
end

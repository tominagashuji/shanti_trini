class FavoritesController < ApplicationController
  def create
    binding.pry
    favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_to events_url, notice: "#{favorite.event.user.name}さんのヨガイベントに参加予約しました！"
  end

  def destroy
    favorite = current_user.favorites.find_by(event_id: params[:event_id]).destroy
    redirect_to events_url, notice: "#{favorite.event.user.name}さんのヨガイベントの参加予約を取り消しました。"
  end
end

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :show, :edit]
  before_action :user_check, only: [:edit]

  def index
    @q = Event.search(params[:q])
    @result = @q.result(distinct: true)

    params[:q] == nil? ? @events = Event.all : @events = @result
    @events = @events.page(params[:page]).per(6)
  end

  def show
    @favorite = current_user.favorites.find_by(event_id: @event.id)
  end

  def new
    params[:back] == nil ? @event = Event.new : @event = Event.new(event_params)
  end

  def edit
  end

  def confirm
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    render :new if @event.invalid?
  end

  def create
    @event = current_user.events.build(event_params)
    @event.image.retrieve_from_cache! params[:cache][:image]

    if @event.save
      EventMailer.event_mail(@event).deliver
      redirect_to events_path, notice: 'イベント作成に成功しました！'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'イベント更新に成功しました！'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'イベントを削除しました。'
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :image, :user_id, :image_cache)
  end

  def login_check
    if current_user.nil?
      redirect_to tops_path, notice:"ログインしてください。"
    end
  end

  def user_check
    binding.pry
    @event = Event.find(params[:id])
    if @event.user_id != current_user.id
      redirect_to events_path, notice:"他人の投稿は編集出来ません。"
    end
  end
end

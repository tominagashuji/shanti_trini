class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_login, only: [:new, :edit, :show]

  def index
    @events = Event.all

    @q = Event.search(params[:q])
    @result = @q.result(distinct: true)

    params[:q] == nil? ? @lists = @events : @lists = @result

    # controller.action_name == 'show' ? "コメントを投稿する" : "コメントを更新する"

    # if params[:q].nil?
    #   @lists = @events
    # else
    #   @lists = @result
    # end

    @lists = @lists.page(params[:page]).per(3)
  end

  def show
    @favorite = current_user.favorites.find_by(event_id: @event.id)
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  def edit
  end

  def confirm
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    render :new if @event.invalid?
  end

  def create
    binding.pry
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.image.retrieve_from_cache! params[:cache][:image]
    @event.save!

    respond_to do |format|
      if @event.save
        EventMailer.event_mail(@event).deliver
        format.html { redirect_to events_path, notice: 'イベント作成に成功しました！' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'イベント更新に成功しました！' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'イベントを削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :content, :image, :user_id, :image_cache)
    end

    def set_login
      if current_user.nil?
        redirect_to tops_path, notice:"ログインしてください。"
      end
    end

end

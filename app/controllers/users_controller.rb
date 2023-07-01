class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    
    @today_book = @books.created_today
    @oneday_ago_book = @books.created_oneday_ago
    @twoday_ago_book = @books.created_twoday_ago
    @threeday_ago_book = @books.created_threeday_ago
    @fourday_ago_book = @books.created_fourday_ago
    @fiveday_ago_book = @books.created_fiveday_ago
    @sixday_ago_book = @books.created_sixday_ago
    @week_book = @books.created_week
    @last_week_book = @books.created_last_week
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def date_count
    @user = User.find(params[:user_id])
     if params[:created_at].present?
        @date_book = @user.books.where(created_at: params[:created_at].to_date.all_day)
     end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end

class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def show
    @user=User.find(params[:id])
    @books=@user.books
  end
  def create
    book=Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end
  def index
    @users=User.all
  end
  def edit
    @user=User.find(params[:id])
  end
  def update
    user=User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end

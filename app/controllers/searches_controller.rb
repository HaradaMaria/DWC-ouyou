class SearchesController < ApplicationController

  
  def search
    @range = params[:range]
    @ward = params[:ward]
    
    if @range == "Book"
      @books = Book.looks(params[:search],params[:ward])
    elsif @range == "User"
      @users = User.looks(params[:search],params[:ward])
    end
  end
  
  
end

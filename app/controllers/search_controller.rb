class SearchController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model,content,method)
    if model == 'user'
      # 完全一致だったら
      if method == 'perfect'
        User.where(name: content)
      # 部分一致
      elsif method == 'partial'
        User.where('name LIKE ?',"%#{content}%")
      # 前方一致
      elsif method == 'forward'
        User.where('name LIKE ?',"#{content}%")
      # 後方一致
      elsif method == 'backward'
        User.where('name LIKE ?',"%#{content}")
      else User.all
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      elsif method == 'partial'
        Book.where('title LIKE ?',"%#{content}%")
      elsif method == 'forward'
        Book.where('title LIKE ?',"#{content}%")
      elsif method == 'backward'
        Book.where('title LIKE ?',"%#{content}")
      else Book.all
      end
    end
  end

end

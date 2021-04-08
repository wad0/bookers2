class SearchController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model,content,method)
    if model == 'user'
      # 完全一致だったら
      if method == 'perfect'
        User.where(name: content)
      # 部分一致だったら
      else
        User.where('name LIKE ?','%'+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      else
        Book.where('title LIKE ?','%'+content+'%')
      end
    end
  end

end

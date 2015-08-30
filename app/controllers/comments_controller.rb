class CommentsController < ApplicationController
  def create
    article = Article.find(params[:comment][:article_id])
    comment = article.comments.create(comment_params)

    flash[:notice] = "Your comment was added."
    word_count = Comment.total_word_count
    comment_statistic = Statistic.find_by(title: 'comment')
    comment_statistic.count = word_count
    comment_statistic.save
    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :author_name, :body)
  end
end

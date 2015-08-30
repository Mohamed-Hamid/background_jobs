class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article_id, :presence => true

  def self.for_dashboard
    order('created_at DESC').limit(5).all
  end

  def word_count
    body.split.count
  end

  def self.total_word_count
    comment_statistic = Statistic.find_by(title: 'comment')
    comment_statistic.count = all.inject(0) {|total, a| total += a.word_count }
    comment_statistic.save
  end
end

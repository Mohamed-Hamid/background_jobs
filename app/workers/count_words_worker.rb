class CountWordsWorker
	 @queue = :count_words

	 def self.perform
 		word_count = Comment.total_word_count
    comment_statistic = Statistic.find_by(title: 'comment')
    comment_statistic.count = word_count
    comment_statistic.save
	 end
end
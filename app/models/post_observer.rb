class PostObserver < ActiveRecord::Observer
  def after_create(post)
    Log.create(:table => "posts", :table_id => post.id, :action => "create", :user_id=> User.current_user.try(:id).to_i)
  end

  def before_update(post)
    post.changes.each do |key, values|
      Log.create(
        :table => "posts",
        :table_id => post.id,
        :action => "update",
        :old_value => values.first,
        :new_value => values.last,
        :user_id=> User.current_user.try(:id).to_i
      )
    end
  end
end

module TasksHelper
  def favorite_icon(user, task)
    classes = ['favorite_icon']

    if user
      classes << (user.favorite?(task) ? 'favorite-on' : 'favorite-off')
    end

    tag.div class: classes, "data-favorite-target": "icon"
  end
end
Then /^we should know that the view with id "(.*?)" exists$/ do |with_this_id|
  on(ButtonScreen) do |screen|
    screen.should have_view(with_this_id)
  end
end

Then /^we should know that the view with id "(.*?)" does not exist$/ do |with_this_id|
  on(ButtonScreen) do |screen|
    screen.should_not have_view(with_this_id)
  end
end


Then /^we should know that the view with (\w+) "(.*?)" exists$/ do |how, what|
  on(ButtonScreen) do |screen|
    locator = {}; locator[how.to_sym] = what
    screen.should have_view(locator)
  end
end

Then /^we should know that the view with (\w+) "(.*?)" does not exist$/ do |how, what|
  on(ButtonScreen) do |screen|
    locator = {}; locator[how.to_sym] = what
    screen.should_not have_view(locator)
  end
end


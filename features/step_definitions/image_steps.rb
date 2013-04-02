Given /^I\'m on the image screen$/  do
  on(MainMenuScreen).views
  on(ViewsMenuScreen).image_view
end

Then /^I should be able to click on the first image$/  do
  on(ImageViewScreen).click_first
end

Then /^the first image should have the following properties:$/  do |properties|
   on(ImageViewScreen) do |screen|
    view = screen.first_view
    properties.hashes.each do |property|
      result = view.send("#{property["property"]}?")
      result.to_s.should eq(property["value"]), "for field #{property["property"]}"
    end
  end
end

Then /^I should be able to wait until the images drawable has loaded$/  do
  on(ImageViewScreen).wait_for_first
end

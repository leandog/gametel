Given /^I am looking at the progress of a seek bar$/ do
  on(MainMenuScreen).views
  on(ViewsMenuScreen).seek_bar
end

When /^I set the progress indicated by "(.*?)" to "(.*?)"$/ do |how, value|
  on(SeekBarScreen) do |screen|
    screen.send "progress_#{how}=", value.to_i
  end
end

Then /^the retrieved progress indicated by "(.*?)" should be "(.*?)"$/ do |how, value|
  on(SeekBarScreen) do |screen|
    screen.send("progress_#{how}").should eq(value.to_i)
  end
end

When /^I set the secondary progress indicated by "(.*?)" to "(.*?)"$/ do |how, value|
  on(SeekBarScreen) do |screen|
    screen.send "progress_#{how}_secondary=", value.to_i
  end
end

When /^the retrieved secondary progress indicated by "(.*?)" should be "(.*?)"$/ do |how, value|
  on(SeekBarScreen) do |screen|
    screen.send("progress_#{how}_secondary").should eq(value.to_i)
  end
end

Then /^the retrieved progress max indicated by "(.*?)" should be "(.*?)"$/ do |how, value|
  on(SeekBarScreen) do |screen|
    screen.send("progress_#{how}_max").should eq(value.to_i)
  end
end

Then /^the progress bar indicated by "(.*?)" can determine the following properties:$/ do |how, properties|
  on(SeekBarScreen) do |screen|
    view = screen.send("progress_#{how}_view")
    properties.hashes.each do |property|
      result = view.send("#{property["property"]}?")
      result.to_s.should eq(property["value"]), "for field #{property["property"]}"
    end
  end
end

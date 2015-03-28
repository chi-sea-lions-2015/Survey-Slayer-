get '/surveys' do
  @surveys = Survey.all
 erb :my_surveys
end

get '/surveys/new' do
  erb :new_survey
end


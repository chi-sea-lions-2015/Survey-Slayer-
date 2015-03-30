get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end


get '/my_surveys' do
  puts "%%%%%%%%%%%%%%%%%"
  user = User.find(1)
  puts '$%!@$!@$@R!@#@#!!$$#!'
  @my_surveys = user.surveys
  # puts "my surveys"
  # puts @my_surveys
  # puts "my surveys length"
  # puts @my_surveys.length

  if @my_surveys.empty?
    redirect '/'
  else
    erb :my_surveys
  end
end

get '/surveys/new' do
  erb :new_survey
end

get '/surveys/:survey_id/results' do
  @survey = Survey.find_by(id: params[:survey_id])
end

post '/surveys' do
  @user = current_user
  puts params
  @survey = @user.surveys.create(params[:survey])
  title = @survey.title
  puts title
  survey_id = @survey.id
  if request.xhr?
    content_type :json
    return {question_form: erb(:'questions/new', layout: false),
      title: title,
      survey_id: survey_id}.to_json
    else
      redirect "/surveys/#{@survey.id}/questions/new"
    end
  end

  get '/surveys/:survey_id/questions/new' do
    @survey = Survey.find_by(id: params[:survey_id])
    erb :"questions/new"
  end

  post '/surveys/:survey_id/questions' do
    survey = Survey.find_by(id: params[:survey_id])
    question = survey.questions.create(params[:question])
    choice1 = question.choices.create(params[:choice1])
    choice2 = question.choices.create(params[:choice2])
    choice3 = question.choices.create(params[:choice3])
    choice4 = question.choices.create(params[:choice4])
    id = params[:id]
    if request.xhr?
      content_type :json
      return {question_form: erb(:'questions/_add', layout: false),
        question: question.title,
        choice1: choice1.title,
        choice2: choice2.title,
        choice3: choice3.title,
        choice4: choice4.title,
        id: id}.to_json
    else
      redirect "/surveys/#{survey.id}/questions/new"
    end
  end


    get '/surveys/:survey_id/questions/:question_id/choices/new' do
      @survey= Survey.find_by(id: params[:survey_id])
      @question = Question.find_by(id: params[:question_id])
      erb :'choices/new'
    end

    post '/surveys/:survey_id/questions/:question_id/choices' do
      @survey = Survey.find_by(id: params[:survey_id])
      @question = Question.find_by(id: params[:question_id])
      @choice1 = @question.choices.create(params[:choice1])
      @choice2 = @question.choices.create(params[:choice2])
      @choice3 = @question.choices.create(params[:choice3])
      @choice4 = @question.choices.create(params[:choice4])
      redirect "/surveys"
    end


    get '/surveys/:survey_id' do

      @survey = Survey.find_by(id: params[:survey_id])

      erb :show
    end

    get '/surveys/:survey_id/questions/:question_id/edit' do
      @survey = Survey.find_by(id: params[:survey_id])
      @question = Question.find_by(id: params[:question_id])

      erb :'/questions/edit'
    end

    put '/surveys/:survey_id/questions/:question_id/edit' do
      @survey = Survey.find_by(id: params[:survey_id])
      @question = Question.find_by(id: params[:question_id])
      choices = @question.choices
      choice1 = @question.choices[0].update_attributes(params[:choice1])
      choice2 = @question.choices[1].update_attributes(params[:choice2])
      choice3 = @question.choices[2].update_attributes(params[:choice3])
      choice4 = @question.choices[3].update_attributes(params[:choice4])
      redirect "/surveys/#{@survey.id}"
    end

    put '/surveys/' do
    end

    delete '/surveys/:survey_id/delete' do

    end


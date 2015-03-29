get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

get '/my_surveys' do
  @user = current_user
  @surveys = Survey.all
  erb :my_surveys
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
      title: @survey.title,
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
    @survey = Survey.find_by(id: params[:survey_id])
    @question = @survey.questions.create(params[:question])
    @choice1 = @question.choices.create(params[:choice1])
    @choice2 = @question.choices.create(params[:choice2])
    @choice3 = @question.choices.create(params[:choice3])
    @choice4 = @question.choices.create(params[:choice4])
    if request.xhr?
      content_type :json
      return {question_form: erb(:'questions/new', layout: false),
        question: @question.title,
        choice1: @choice1.title,
        choice2: @choice2.title,
        choice3: @choice3.title,
        choice4: @choice4.title}.to_json
    else
      redirect "/surveys/#{@survey.id}/questions/new"
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


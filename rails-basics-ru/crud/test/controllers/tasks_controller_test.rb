require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one) # Assuming Task fixtures are defined, and "one" is one of them.
  end

  test 'can see the welcome page' do
    get '/'
    assert_select 'h1', 'All Tasks'
  end

  test 'can create a task' do
    get '/tasks/new'
    assert_response :success

    post '/tasks', params: { task: { name: 'Some title', description: 'Some description', creator: 'John Doe' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', "Some title"
  end

  test 'can edit a task' do
    get edit_task_path(@task)
    assert_response :success

    patch task_path(@task), params: { task:  { name: 'Updated title' } }
    assert_redirected_to task_path(@task)
    follow_redirect!
    assert_select 'h1', 'Updated title'
  end

  test 'can delete a task' do
    assert_difference('Task.count', -1) do
      delete task_path(@task)
    end

    assert_redirected_to tasks_path
    follow_redirect!
    assert_select 'h1', 'All Tasks'
  end
end
require 'swagger_helper'

describe 'Tasks API' do
  path '/tasks' do
    get 'Retrieves all tasks' do
      response '200', 'tasks found' do
        run_test!
      end
    end
  end
end

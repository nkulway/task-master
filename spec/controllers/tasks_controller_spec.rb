# spec/integration/tasks_spec.rb
require 'swagger_helper'

describe 'Tasks API' do
  path '/tasks' do
    get 'Retrieves all tasks' do
      tags 'Tasks'
      response '200', 'Tasks found' do
        schema type: :array, items: { '$ref' => '#/components/schemas/task' }

        run_test!
      end
    end
  end

  path '/tasks/{id}' do
    get 'Retrieves a task' do
      tags 'Tasks'
      parameter name: 'id', in: :path, type: :integer, description: 'Task ID'

      response '200', 'Task found' do
        schema '$ref' => '#/components/schemas/task'
        run_test!
      end

      response '404', 'Task not found' do
        run_test!
      end
    end
  end

  path '/tasks' do
    post 'Creates a task' do
      tags 'Tasks'
      parameter name: 'task', in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          name: { type: :string },
          completed: { type: :boolean },
          description: { type: :string }
        },
        required: [ 'title', 'name', 'completed' ]
      }

      response '201', 'Task created' do
        let(:task) { { title: 'New Task', name: 'Task 1', completed: false, description: 'A task description' } }
        run_test!
      end

      response '422', 'Invalid input' do
        let(:task) { { title: '', name: 'Task 1', completed: false } }
        run_test!
      end
    end
  end
end

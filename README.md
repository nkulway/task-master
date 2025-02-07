# Rails Backend for Task Management

This is the backend API built with Ruby on Rails for managing tasks. The frontend communicates with this API to perform CRUD operations on tasks.

## Prerequisites

Before running the application, ensure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Rails](https://guides.rubyonrails.org/getting_started.html)
- [PostgreSQL](https://www.postgresql.org/download/)

## Setup

1. Clone the repository:

2. Install Ruby dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

4. Seed the database (optional):

    ```bash
    rails db:seed
    ```

## Running the Application

1. Start the Rails server:

    ```bash
    rails server
    ```

2. Visit `http://localhost:3000` in your browser or use it as an API endpoint for the frontend.
  a. The frontend project can be found [here](https://github.com/nkulway/task-master-web-app) 

The backend will now be running, and it will handle requests related to task management.

## API Endpoints

The backend provides the following API endpoints for managing tasks:

- `GET /tasks`: Retrieves the list of tasks.
- `POST /tasks`: Creates a new task.
- `PATCH /tasks/:id`: Updates an existing task.
- `DELETE /tasks/:id`: Deletes a task.

## Swagger API Documentation

This project uses **Swagger** (via Rswag) to document and test the API endpoints. Swagger provides an interactive interface for exploring and testing the API.

### 📜 Swagger Overview

Swagger is a toolset that generates interactive API documentation based on your controllers and endpoint definitions. With Swagger, you can:

- View all available API endpoints.
- Test API endpoints directly from the documentation.
- Understand request/response formats, parameters, and error codes.

### 🚀 Accessing the Swagger UI

To view the API documentation in your browser:

1. Start the Rails server:
   ```bash
   rails server
   ```
2. Navigate to the Swagger UI:
   ```
   http://localhost:3000/api-docs
   ```

Here, you can explore and test the API endpoints.

### 🔧 Swagger Configuration

Swagger is configured using Rswag. The configuration file is located at:

- `spec/swagger_helper.rb`: Defines general Swagger settings.
- `spec/swagger/v1/swagger.yaml`: Stores the generated API documentation.

To regenerate the Swagger YAML file, run:

```bash
bundle exec rake rswag:specs:swaggerize
```

### 📋 Example API Endpoints

| Method | Endpoint       | Description               |
|--------|----------------|---------------------------|
| GET    | `/tasks`       | Fetches all tasks.        |
| POST   | `/tasks`       | Creates a new task.       |
| GET    | `/tasks/:id`   | Fetches a specific task.  |
| PUT    | `/tasks/:id`   | Updates a specific task.  |
| DELETE | `/tasks/:id`   | Deletes a specific task.  |

### 🛠 Customizing Swagger

To customize the API documentation:

1. Add Swagger annotations to your controller actions using `swagger_api`.
2. Regenerate the Swagger YAML file using the command mentioned above.

## CORS Configuration

CORS (Cross-Origin Resource Sharing) is configured to allow communication between the frontend and the backend. The backend allows all origins for development purposes.

```ruby
# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```


## Notes

- Ensure the Rails backend and Angular frontend are both running in parallel for seamless communication.
- The backend is designed to handle the task management logic, while the frontend handles the user interface.

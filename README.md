# Rails Backend for Task Management

This is the backend API built with Ruby on Rails for managing tasks. The frontend communicates with this API to perform CRUD operations on tasks.

## Prerequisites

Before running the application, ensure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Rails](https://guides.rubyonrails.org/getting_started.html)
- [PostgreSQL](https://www.postgresql.org/download/)

## Setup

1. Clone the repository:

    ```bash
    git clone <repo-url> backend
    cd backend
    ```

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

The backend will now be running, and it will handle requests related to task management.

## API Endpoints

The backend provides the following API endpoints for managing tasks:

- `GET /tasks`: Retrieves the list of tasks.
- `POST /tasks`: Creates a new task.
- `PATCH /tasks/:id`: Updates an existing task.
- `DELETE /tasks/:id`: Deletes a task.

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

## Folder Structure

```bash
backend/
├── app/
│   ├── controllers/       # Controller files for handling requests
│   ├── models/            # Model files for tasks
│   └── serializers/       # Serializer for task responses (if applicable)
├── config/                # Configuration files
│   └── cors.rb            # CORS configuration for allowing frontend requests
├── db/                    # Database files and migrations
├── Gemfile                # Ruby dependencies
├── Gemfile.lock           # Lock file for Ruby dependencies
├── config.ru              # Rack configuration file
└── routes.rb              # Defines the routes (API endpoints)
```

## Notes

- Ensure the Rails backend and Angular frontend are both running in parallel for seamless communication.
- The backend is designed to handle the task management logic, while the frontend handles the user interface.
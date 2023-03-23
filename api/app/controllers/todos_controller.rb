class TodosController < ApplicationController
    before_action :session_expired?

    def create
        todo = user.todos.create(todo_params)
        if todo.valid?
            app_response(status: :created, data: todo)
        else
            app_response()
    end

    def todo_params
        params.permit(:title, :description, :status, :priority)
    end

end

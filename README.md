# README

* Ruby 2.4.2
* Rails 5.0.6
* PostgreSQL
* Vanilla Javascript

## About the Project

Much like other apps I've built, this one was inspired by my need for a specific tool to make my life easier. I was working my way through a self-paced software engineering curriculum and wanted to be able to primarily 1) track my progress and 2) estimate my completion date. I built this app and it has, indeed, solved my problem. People with login credentials can see it here [vcs-progress-tracker.herokuapp.com](https://vcs-progress-tracker.herokuapp.com/)

### App Features

- Tracks tasks
- Calculates velocity based on point value and dates
- Uses Ajax for CRUD actions
- Allows pausing of a task
- User can star favorite tasks
- Shows task status by color


# Tour of The App
The home page contains a dashboard that displays calculations of velocity and a list of all of my tasks. In this view, the tasks are separated into sections: "Current Task", "To Do", and the perpetually rewarding "Completed" section.

![Alt text](/app/assets/images/screenshots/tasks_index.png?raw=true "Home Page - Dashboard")

Below the dashboard, each task's status is visually indicated by color, which is handled by a view helper:
```erb
<!-- app/views/tasks/_task.html.erb -->

<article class="task <%= completion_status_class(task) %>">
```

```ruby
# app/helpers/tasks_helper.rb

module TasksHelper

  def completion_status_class(task)
    if task.paused? && !task.complete?
      'paused'
    elsif task.current?
      'current-task'
    elsif task.complete?
      'complete'
    else
      'incomplete'
    end
  end
  ...
```

The view helper takes advantage of `Task` state methods to assign the appropriate css class to each task.

```css
/* app/assets/stylesheets/tasks.scss */

.tasks-section {
  ...
  .current-task { border: 1px solid $teal; }
  .incomplete { border: 1px solid $pink; }
  .paused { border: 1px solid $yellow; }
  .complete {
    border: 1px solid lightgray;
    background-color: $gray;
  }
}
```

Adding a task is simple because the new task form appears at the top of the index page and then the new task is then added to the page via javascript.

![Alt text](/app/assets/images/screenshots/task_new.png?raw=true "Adding a new task")

As a user, when I start or complete a task, I edit the task via javascript to add the appropriate date.

![Alt text](/app/assets/images/screenshots/tasks_edit.png?raw=true "Editing a task")

But sometimes, I'm waiting for input from other people on my current task and want to start another task while I'm waiting. To accomplish this, I added a `paused` boolean. Any time I start a new task while I have a current one open, it automatically pauses my current task in an `after_save` action. Also, in order to keep my velocity calculations clean, I remove any existing paused state from newly completed tasks in a `before_save` action.

```ruby
# app/models/task.rb

before_save :unpause_completes_and_not_starteds
after_save :pause_other_current_tasks
```

This feature keeps me from needing to remember to pause/unpause manually, and that comes in pretty handy.

The Curriculum page gives a nice overview of all tasks, by category, with their point values and completion status. Again, the task status drives the css indicators. (Apologies for the blurred-out content. The school did not publish the details of its curriculum publically, and I'm honoring that confidentiality.)

![Alt text](/app/assets/images/screenshots/curriculum_index.png?raw=true "Curriculum Status")


# App Architecture
The schema of this app is quite straightforward. We've got `category`s and `task`s where a `category` `has_many :tasks`. The `user` model has very few responsibilities and is implemented with Devise. Thanks [rails-erd](https://github.com/voormedia/rails-erd) for that sweet ERD gem that generated this image:

![Alt text](/app/assets/images/screenshots/erd.png?raw=true "Schema ERD")

### App Architecture Evaluation
RubyCritic gives this codebase an overall score of 97.79.

![Alt text](/app/assets/images/screenshots/rubycritic.png?raw=true "RubyCritic Stats")

Tha majority of the dots are in the lower left quadrant, i.e. the [healthy closure region](https://github.com/chad/turbulence#hopefully-meaningful-metrics). I attribute that to single-purpose objects. One of my favorites is the `TaskSet`, which takes the responsibilty of defining sets of tasks away from the `Task` model, as the `Task` model should really only know about an individual task. It also makes for easy-to-understand view logic for rendering partials:

```erb
<!-- app/views/tasks/index.html.erb -->
...

<h2>Current Task</h2>
<%= render partial: 'task', collection: @task_set.current %>

<h2>To Do (<%= @task_set.percent_incomplete %>%)</h2>
<%= render partial: 'task', collection: @task_set.to_do %>

<h2>Completed Tasks (<%= @task_set.percent_complete %>%)</h2>
<%= render partial: 'task', collection: @task_set.completed %>
```

To accomplish this tidy rendering of partials, the `@task_set` for this view is initialized in the `tasks_controller` with all `Task`s:

```ruby
# app/controllers/tasks_controller

class TasksController < ApplicationController
...

  def index
    @task_set = TaskSet.new(Task.all)
  end
  ...

  ```

And then quickly divvies them up into the usable sets sets we need, using the scopes defined in the `Task` model.

```ruby
# app/models/task_set.rb

class TaskSet
  ...

  def initialize(tasks)
    @tasks = tasks
    @current = tasks.incomplete.started.not_paused
    @to_do = tasks.incomplete.not_started.or(tasks.incomplete.where(paused: true)).order('lesson_number')
    @completed = tasks.completed.order('completed_on DESC')
  end
```


The dashboard stats make heavy use of the `TaskSet` methods.

![Alt text](/app/assets/images/screenshots/dashboard.png?raw=true "Dashboard Stats")

The `TaskSet` methods are simple one-liners like these that do one thing and one thing only:

```ruby
# app/models/task_set.rb

def points_remaining
  to_do.empty? ? 0 : sum(to_do, 'point_value')
end

def points_completed
  @points_completed ||= sum(completed, 'point_value')
end

def total_points
  @total_points ||= sum(tasks, 'point_value')
end

private

def sum(set, method)
  set.pluck(method).reduce(&:+)
end
```

In the process of creating this suite of simple single-purpose methods, I discovered that `Task` and `TaskSet` had some redundant methods. I took this opportunity to pull them out into `TaskShared` module, and then include that module in the other two models.

```ruby
# app/models/task.rb

class Task
...
  include TaskShared
...


# app/models/task_set.rb

class TaskSet
...
  include TaskShared
...
```

I've enjoyed using this app immensely -- especially as I accomplished large-point-value tasks and my completion date drew nearer and nearer.  Connect with me if you'd like to know more.

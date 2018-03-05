# README

* Ruby 2.4.2
* Rails 5.0.6
* PostgreSQL

## About the Project

This app is designed to track my progress through an engineering curriculum, showing metrics on current progress, velocity, and projected completion dates. See it here [vcs-progress-tracker.herokuapp.com](https://vcs-progress-tracker.herokuapp.com/)

# Tour of The App
The home page is a dashboard that displays calculations of velocity and all of my tasks. The tasks are separated into "Current Task" and "To Do" sections.
![Alt text](/app/assets/images/screenshots/tasks_index.png?raw=true "Home Page - Dashboard")

The tasks' status is indicated by color, which is handled by a view helper:
```erb
<!-- app/views/tasks/_task.html.erb -->

<article class="task <%= completion_status_class(task) %>">
```

The task helper takes advantage of `Task` state methods, which then assign different css classes.

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

When I start or complete a task, I edit the task to add the appropriate date.

![Alt text](/app/assets/images/screenshots/tasks_edit.png?raw=true "Editing a task")

But sometimes, I'm waiting for input on my current task and want to start another task while I'm waiting. To accomplish this, I added a `paused` boolean. Any time I start a new task while I have a current one open, it automatically pauses my current task in an `after_save` action. Also, in order to keep my velocity calculations clean, I remove any existing paused state from newly completed tasks in a `before_save` action.

```ruby
# app/models/task.rb

before_save :unpause_completes_and_not_starteds
after_save :pause_other_current_tasks
```

This feature keeps me from needing to remember to pause/unpause, and that comes in pretty handy.

The Curriculum page give a nice overview of all tasks, by category with their point values and completion status. Again, the task status drives the css indicators. (Apologies for the blurred-out content. The school did not publish the details of its curriculum publically.)

![Alt text](/app/assets/images/screenshots/curriculum_index.png?raw=true "Curriculum Status")


# App Architecture
The schema of this app is very basic. We've got `category`s and `task`s where a `category` `has_many :tasks`. The `user` model has very few responsibilities and it implemented with Devise. Thanks [rails-erd](https://github.com/voormedia/rails-erd) for that sweet ERD gem.

![Alt text](/app/assets/images/screenshots/erd.png?raw=true "Schema ERD")

### App Architecture Evaluation
RubyCritic gives this codebase an overall score of 97.79.

![Alt text](/app/assets/images/screenshots/rubycritic.png?raw=true "RubyCritic Stats")

Tha majority of the dots are in the lower left quadrant, i.e. the [healthy closure region](https://github.com/chad/turbulence#hopefully-meaningful-metrics). I attribute that to single-purpose objects. One of my favorites is the `TaskSet`, which takes the responsibilty of divvying up sets of tasks away from `Task` -- which should really only know about an individual task. It also makes for easy-to-understand view logic for rendering partials:

```erb
<h2>Current Task</h2>
<%= render partial: 'task', collection: @task_set.current %>

<h2>To Do (<%= @task_set.percent_incomplete %>%)</h2>
<%= render partial: 'task', collection: @task_set.to_do %>

<h2>Completed Tasks (<%= @task_set.percent_complete %>%)</h2>
<%= render partial: 'task', collection: @task_set.completed %>
```

The dashboard stats make heavy use of the `TaskSet`



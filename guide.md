Sure, here's a more detailed step-by-step walkthrough for creating a mood tracker/journal/trigger tracker using Ruby on Rails:

**Step 1: Install prerequisites**

First, you need to install Ruby and Rails on your Windows machine. You can download and install Ruby from the official website at https://rubyinstaller.org/. After installing Ruby, you can open a command prompt and run the following command to install Rails:

```
gem install rails
```

**Step 2: Create a new Rails application**

To create a new Rails application, open a command prompt and navigate to the directory where you want to create the application. Then, run the following command:

```
rails new moodtracker
```

This will create a new Rails application in a directory called "moodtracker."

**Step 3: Set up the database**

Next, you need to set up a database for your application. Ruby on Rails uses a database to store data, so you need to create a database for your application to work.

To create the database, navigate to the root directory of your application and run the following command:

```
rails db:create
```

This will create a new database for your application.

**Step 4: Create models for mood, journal, and trigger**

In Rails, models are used to represent data and handle interactions between the application and the database. To create models for mood, journal, and trigger, run the following commands in your command prompt:

```
rails generate model Mood date:datetime mood:string notes:string
```

```
rails generate model Journal date:datetime entry:string
```

```
rails generate model Trigger name:string
```

Each of these commands will create a new model file in the "app/models" directory of your application, along with a migration file in the "db/migrate" directory.

**Step 5: Set up the associations between models**

Now that you have created the models, you need to set up the associations between them. Open the newly created model files in a text editor and add the following associations:

For Mood model:
```
class Mood < ApplicationRecord
  has_many :mood_triggers, dependent: :destroy
  has_many :triggers, through: :mood_triggers
end
```

For Trigger model:
```
class Trigger < ApplicationRecord
  has_many :mood_triggers, dependent: :destroy
  has_many :moods, through: :mood_triggers
end
```

For Journal model:
```
class Journal < ApplicationRecord
  belongs_to :mood, optional: true
end
```

This will set up a many-to-many relationship between Moods and Triggers, as well as a one-to-many relationship between Moods and Journals.

**Step 6: Create controllers and views**

Now that you have set up the models and associations, you can create the controllers and views for your application. Controllers handle requests from the user and interact with the models, while views display information to the user.

To create the Moods controller, run the following command in your command prompt:
```
rails generate controller Moods
```

To create the Journals controller, run the following command in your command prompt:
```
rails generate controller Journals
```

To create the Triggers controller, run the following command in your command prompt:
```
rails generate controller Triggers
```

These commands will create a new controller file in the "app/controllers" directory of your application, along with a corresponding view file in the "app/views" directory.

**Step 7: Design the user interface**

Now that you have set up the controllers and views, you can design the user interface for your application. Open the "app/views" directory and create new HTML files or modify the existing files using HTML, CSS, and Ruby code to allow users to enter their mood, journal entry, and trigger information.

Here's an example of how your form for creating a new mood might look like, in a file called `app/views/moods/new.html.erb`:

```html
<h1>Create a new mood</h1>

<%= form_with(model: @mood, url: moods_path) do |form| %>
  <p>
    <%= form.label :date %><br>
    <%= form.datetime_local_field :date %>
  </p>

  <p>
    <%= form.label :mood %><br>
    <%= form.select :mood, ['Happy', 'Sad', 'Angry', 'Anxious'] %>
  </p>

  <p>
    <%= form.label :notes %><br>
    <%= form.text_field :notes %>
  </p>

  <p>
    <%= form.label :triggers %><br>
    <%= form.collection_check_boxes :trigger_ids, Trigger.all, :id, :name do |b| %>
      <%= b.label class: "checkbox" do %>
        <%= b.check_box class: "trigger_checkbox" %>
        <%= b.object.name %>
      <% end %>
    <% end %>
  </p>

  <p>
    <%= form.submit "Submit" %>
  </p>
<% end %>
```

**Step 8: Add authentication functionality**

To add authentication functionality to your application, you can use a gem like Devise. Devise provides a set of pre-built authentication features that you can use in your application.

To use Devise, add the following line to your Gemfile and run bundle install:

```
gem 'devise'
```

Next, run the following command to install Devise:

```
rails generate devise:install
```

This will install Devise and generate a configuration file in "config/initializers/devise.rb". To create a User model with Devise, run the following command:

```
rails generate devise User
```

This will generate a new migration file which you need to run with the following command:

```
rails db:migrate
```

After running the migration, you can add authentication to your controllers by adding "before_action :authenticate_user!" to the top of each controller.

**Step 9: Deploy the application**

To deploy your application to a platform like Heroku, you need to create a Git repository for your application and push it to a remote repository. Here are the steps to do this:

1. Create a new remote Git repository on a service like GitHub or Bitbucket.
2. Navigate to the root directory of your application in the command prompt and run the following commands:
```
git init
git add .
git commit -m "Initial commit"
git remote add origin <remote repository URL>
git push -u origin master
```
3. Sign up for a Heroku account and install the Heroku CLI on your machine.
4. Run the following command in your command prompt to create a new Heroku app:
```
heroku create <your app name>
```
5. Push your application to Heroku using Git:
```
git push heroku master
```
6. Run the following command to migrate your database on Heroku:
```
heroku run rails db:migrate
```
7. Open your application in a browser by running the following command:
```
heroku open
```

Congratulations! By following these steps, you will have created a mood tracker/journal/trigger tracker web application using Ruby on Rails that you can run on Windows.
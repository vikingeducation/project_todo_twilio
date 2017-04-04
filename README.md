# todo_twilio

[The Twilio API project on Ruby on Rails from the Viking Code School](http://www.vikingcodeschool.com)


Keep track of your tasks with this simple app:   
- Set deadlines, priority levels, and add poetic descriptions to your tasks  
- View tasks in ascending and descending order, according to priority levels   
- Create sticky tasks if you prefer to organise them as important / not important 

---
## Texts

This app uses [Figaro](https://github.com/laserlemon/figaro) and [Twilio](https://www.twilio.com) to send out texts.  
Once you've set up a Twilio account, grab the `id` and `token` and store them in the app's `config/application.yml`:

```ruby
# config/application.yml
twilio_id: 'xxxxx'
twilio_token: 'xxxxx'
```


[Yi-Xuan Lau](https://github.com/yxlau/project_todo_twilio)
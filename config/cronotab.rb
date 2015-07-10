# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#
require 'rake'

CelesteApp::Application.load_tasks

class Job
  def perform
    Rake::Task[':shipping_data'].invoke
  end
end

Crono.perform(Job).every 1.hours, at: {min:00}

# require 'rake'
# # Be sure to change AppName to your application name!
# AppName::Application.load_tasks

# class Test
#   def perform
#     Rake::Task['crono:hello'].invoke
#   end
# end

# Crono.perform(Test).every 5.second
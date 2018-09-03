This project is built with Sinatra, a lightweight application. It was deployed onto the Ubuntu server using Passenger.

Please see the Gemfile for a list of the two gems used in the project. They are locked into specific versions, which are the latest versions of each gem (as of August 2018).

The `app.rb` file has the logic for the event logger. There, via a POST request, it plucks from the requested GitHub fields (state of pull request, the time/date in epoch format, pull request number, GitHub username, and name of branch). The event data is then printed onto a text file after a successful open or closed pull request. The GitHub webhooks URL was created using Ngrok, which allows you to tunnel requests on a local machine. To tie together Sinatra and Passenger, you must have a `config.ru` file.

This logic is replicated on the FPF assignment Ubuntu server. I downloaded Ruby, RVM, and Git there and created another user (called "cj"). For both root and cj, the project should be located in the root directory.

You should be able to successfully create a log file once deployed.

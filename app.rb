require 'sinatra/base'

class App < Sinatra::Base
  post "/github_event" do
    parsed_payload = JSON.parse(params[:payload])
    pull_request_state = parsed_payload['pull_request']['state']
    pull_request_event_timestamp = if parsed_payload['pull_request']['updated_at']
      DateTime.parse(parsed_payload['pull_request']['updated_at']).to_time.to_i
    else
      DateTime.parse(parsed_payload['pull_request']['created_at']).to_time.to_i
    end
    number_of_pull_requests = parsed_payload['number']
    username = parsed_payload['pull_request']['user']['login']
    head_branch = parsed_payload['pull_request']['head']['label']

    event_str = "State: #{pull_request_state}, Timestamp: #{pull_request_event_timestamp}, "\
    "Number of Pull Request #{number_of_pull_requests}, Username: #{username}, "\
    "Head Branch: #{head_branch} \n"
    log_file_path = 'github_event_logfile.txt'

    File.open(log_file_path, 'w') do |file|
      file.write(event_str)
    end
  end
end

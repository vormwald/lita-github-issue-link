#  https://github.com/github/hubot-scripts/blob/master/src/scripts/github-issue-link.coffee
module Lita
  module Handlers
    class GithubIssueLink < Handler
      config :access_token, type: String, required: true
      config :github_repo, type: String, required: true
      config :github_api, type: String, required: false

      route(/((\S*|^)?#(\d+)).*/, :respond)

      def respond(response)
        issue_number = response.match_data[3]
        # response.reply(response.match_data.inspect)

        if issue_number
          # if msg.match[2] == undefined
          #   bot_github_repo = github.qualified_repo process.env.HUBOT_GITHUB_REPO
          # else
          #   bot_github_repo = github.qualified_repo msg.match[2]
          # TODO: add redis caching (http://docs.lita.io/plugin-authoring/handlers/#examples)
          req = http.get api_url_for_issue(issue_number), access_token: config.access_token
          data = MultiJson.load(req.body)
          response.reply(message(data))
        end
      end

      private

      def base_url
        config.github_api || 'https://api.github.com'
      end

      def api_url_for_issue(issue_number)
        "#{base_url}/repos/#{config.github_repo}/issues/#{issue_number}"
      end

      def message(data)
        "#{issue_or_pull_request(data)} #{data['number']}: #{data['title']}\n#{data['html_url']}"
      end

      def issue_or_pull_request(data)
        return 'PR' if data.has_key?('pull_request')

        'Issue'
      end
    end

    Lita.register_handler(GithubIssueLink)
  end
end

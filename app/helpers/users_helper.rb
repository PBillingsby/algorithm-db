module UsersHelper
  def handle_query(users, query_string) # Handles queried users through AR association
    queried_users = []
    users.each do |user|
      queried_users << { # Creating view friendly hash for iteration
        username: user.username,
        "#{query_string}": user.send(query_string).count
    }
    end
    queried_users
  end
end

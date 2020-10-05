# Gift Giver

An app to help you be the best Gift Giver out there - on top of all of your loved ones brithdays, changing interests and getting gifts there on time!

# Table Of Contents 
- [Description](https://github.com/sbrook13/Gift_Giver_Backend#description)
- [Example Code](https://github.com/sbrook13/Gift_Giver_Backend#example-code)
- [Technology Used](https://github.com/sbrook13/Gift_Giver_Backend#technology-used)
- [Setting up for the Application](https://github.com/sbrook13/Gift_Giver_Backend#setting-up-for-the-application)
- [Main Features](https://github.com/sbrook13/Gift_Giver_Backend#main-features)
- [Features in Progress](https://github.com/sbrook13/Gift_Giver_Backend#features-in-progress)
- [Contact Information](https://github.com/sbrook13/Gift_Giver_Backend#contact-information)
- [Link to Frontend Repo](https://github.com/sbrook13/Gift_Giver_Backend#link-to-frontend-repo)

## Description

Gift Giver is a web application that allows a logged in user to record loved ones birthdays, interests, and mailing addresses. Your stored information is secured by tokens and authentication on the backend. Search for suggested gifts based on age and relationship to you (i.e. Mom) with the click of a button! Add the person's current interests, remove old interests, update their address or other information, and remove them from your list when needed.

## Example Code

### User Validations

![User Setup](https://i.imgur.com/hcCFuzp.jpg)

### Schema for user

![User Schema](https://i.imgur.com/JuAzVuJ.jpg)

### Loved One Validation

![Add Loved One](https://i.imgur.com/ypI5vQa.jpg)

### Schema for Loved One

![Loved One Schema](https://i.imgur.com/L7QkZI8.jpg)

### Authenticate User
```
    before_action :authenticate

    def authenticate
        auth_header = request.headers["Authorization"]
        if !auth_header
            render json: {error: "No token"}, status: :unauthorized
        else
            begin
                token = auth_header.split(" ")[1]
                secret = Rails.application.secret_key_base
                payload = JWT.decode(token, secret)[0]
                @user = User.find payload["user_id"]
            rescue
                render json: {error: "Bad token"}, status: :forbidden
            end
        end
    end
```

### Login Method

```
skip_before_action :authenticate, only: [:login]
    
    def login
        @user = User.find_by username: params[:username]
        if !@user
            render json: {error: "Username or password is incorrect"}, status: :unauthorized
        else
            if !@user.authenticate params[:password]
                render json: {error: "Username or password is incorrect"}, status: :unauthorized
            else
                payload = { user_id: @user.id }
                secret = Rails.application.secret_key_base
                token = JWT.encode payload,secret

                render json: {token: token}, status: :created
            end
        end
    end
```

## Technology Used

- Ruby on Rails
- Sqlite3 

## Setting up for the application

First you must run

``` 
     bundle install 
```

Then

``` 
     rails db:migrate 
```
``` 
     rails db:seed 
 ```

To start the server run

```
    rails s -p 3000 
```

## Main Features

- User can sign up/sign in with authentication.
- User can add a loved one's name, relationship, birthday, gender, interests and mailing address.
- User can update loved one's information, and remove them.

## Features in Progress

- Saving gift ideas to the loved one's note.
- A list of all upcoming birthdays on your dashboard.
- Integrating with SendGrid for automated email notifications.

## Contact Information

Created by [Shelley Brook](https://www.linkedin.com/in/sbrook13/)


## Link to Frontend Repo

https://github.com/sbrook13/Gift-Giver-Frontend


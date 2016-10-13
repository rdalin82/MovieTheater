# Movie Theater 

## Versions 

Ruby 2.2.1 and Rails 4.2.0

## Description 

This is a rails app that simulates a movie theater ticket buying application.  The main page lists the movies a user can select from to purchase tickets.  There are also links in the navigation bar to tickets and auditoriums.  The tickets link leads the user to view all ticket purchases grouped by movie and with totals for each movie.  The auditoriums link shows all the available auditoriums, with routes to add new auditoriums, delete and edit auditoriums.  There is also links to view movies for each auditorium.  The movies are nested within the auditorium route. The movies nexted within the auditoriums route have links to add new movies, edit and delete movies within each auditorium.   

When purchasing tickets, the user enters name, email, and credit card information.  If all the information is validated it creates a success flash, new ticket is created, and it sends the user an email with the movie information. If the user has entered in valid information then they receive a warning flash with the appropriate error.  The user isn't provided a link to buy a ticket if the movie is sold out.  This is measured by the capacity of the auditorium compared to tickets sold.  


## Future tasks 

1. Create more capybara features tests 
2. Develop a more useful user email 
3. Add authentication 
4. Add actual credit card processing 


## How to run 

1. ``` bundle ```
2. ``` echo password: YOUR_PASSWORD >> config.yml && echo email: YOUR_EMAIL >> config.yml ```
3. ``` rake db:migrate ```
4. ``` rake db:seed ```

## Run tests

``` rspec ```
- - - - - 

Things Needing to be Fixed
- Recording active toggle in newline instead of in-line
- CSS/Javascript requires (using the asset pipeline or not -- http://guides.rubyonrails.org/asset_pipeline.html)
    -> Specifically for the flash notice (to make it more obvious)

Next Steps
- Class level method/view
    -> Most Viewed Show
    -> User's Most Viewed Show (most viewed show and of the shows that user has recorded)
    -> Note : Changing from character because characters don't really have enough info to warrant their own show page... Included the info/updates for that anyway (just in case)

- - - - - 


Referenced Labs/Projects
https://github.com/raiet13/imdbfilmdistribution-cli-app
https://github.com/raiet13/sinatra-nnktoo
https://github.com/raiet13/rails-amusement-park-v-000

- - - - - 

Third Party Sign In
- https://console.developers.google.com/apis/credentials?project=learn-rails-user-recordings&folder

- https://learn.co/tracks/full-stack-web-development-v5/rails/authentication/omniauth
- https://github.com/zquestz/omniauth-google-oauth2
- https://github.com/omniauth/omniauth
- https://richonrails.com/articles/google-authentication-in-ruby-on-rails

- https://www.youtube.com/embed/wsbfUc-CPbg?rel=0&showinfo=0


- - - - - 

Functionality Notes (logical flow for later perusal)
- Users can create shows, edit shows, and delete shows
    -> They should only be able to edit/delete shows that they created
    -> Doing this would require that shows track their creator
    -> Functionally, it would be worthwhile to then have other users be able to request updates/changes due to not being able to edit directly
        -> Also, would recommend that shows in shows index be listed Alphabetically and dupes flagged
- Characters should only be modifiable if user has recorded show AND if user created them
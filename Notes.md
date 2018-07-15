- - - - - 

Things Needing to be Fixed
- User edit path
- Recording active toggle in newline instead of in-line
- Character new/edit path <<-- **CURRENT FOCUS
- CSS/Javascript requires (using the asset pipeline or not -- http://guides.rubyonrails.org/asset_pipeline.html)
    -> Specifically for the flash notice (to make it more obvious)

Next Steps
- Class level method/view
- Third Party Log In

- - - - - 


Referenced Labs/Projects
https://github.com/raiet13/imdbfilmdistribution-cli-app
https://github.com/raiet13/sinatra-nnktoo
https://github.com/raiet13/rails-amusement-park-v-000


- - - - - 

Functionality Notes (logical flow for later perusal)
- Users can create shows, edit shows, and delete shows
    -> They should only be able to edit/delete shows that they created
    -> Doing this would require that shows track their creator
    -> Functionally, it would be worthwhile to then have other users be able to request updates/changes due to not being able to edit directly
        -> Also, would recommend that shows in shows index be listed Alphabetically and dupes flagged
- Characters should only be modifiable if user has recorded show AND if user created them
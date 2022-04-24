# DCLMobileCandidate


# Architecture

Followed MVVM architecture:

ViewModel - Fetches data from Repository and let know view controller once data is loaded via delegate pattern.
Repository - Responsible to fetch data from server and store data into database if offline support is required
ViewController - Controls refreshing and actions of view.

No External (3rd party) libraries are used to build this project

# Improvements

Build UI using autolayout manually, storyboard's are pain to maintain.

Introduce sort feature for the list

Build details screen for each comic so that user can view more description/details about the selected comic.

I would like to use Combine/ Async, Await released by apple to build MVVM pattern. To update data once data is loaded, we could use publishers, subscriber pattern instead of delegate pattern.




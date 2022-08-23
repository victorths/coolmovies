# Coolmovies mobile challenge
The project was built using Flutter version 3.0.5.
To run the project run the following commands using Flutter 3.0.5:

        flutter pub get
        flutter run

As the test did not specify any architecture to use I used a self made architecture based on Clean Arch and following the SOLID concepts (excluding the dependency inversion part, to save time) with some concepts from MVVM.
To manage page state and dependency injection I used the Get package.
I had a problem when I was creating a new Review because this data didn't come when I fetch the Review, I managed to solve it by applying a resetStore in the GraphQl client whenever I went to get the Reviews.
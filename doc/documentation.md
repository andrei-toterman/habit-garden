<style>
* {
    color: #004368;
    font-family: 'Noto Sans';
    font-weight: bold;
    text-align: justify;
    text-justify: inter-word;
}
body {
    background-color: #F7E8FF;
    width: 50%;
    margin: auto;
}
h1 {
    font-weight: 800;
    background-color: #BD83EB;
    padding: 10px;
    border-radius: 10px;
}
h2 {
    font-weight: bold;
    background-color: #90C8F1;
    padding: 5px;
    border-radius: 10px;
}
code {
    color: brown;
    font-family: 'Courier New', monospace;
}
pre {
    background-color: #ede4f1;
    padding: 10px;
}
</style>

![][title]
# Team: Runtime Terror 831
- Andrei Toterman
- Delia Cremene
- Codrin Diac
- Ovidiu Sâmpălean
- Sonia Terec
- Alexandru Maxim
- Sebastian Lazea

# Introduction
Habit Garden is an Android app created to help users form better habits or get rid of bad ones. The user can create a list of such habits that will be represented as a garden of flowers. In this way, the user is motivated to stick to their habits in order to take care of their virtual flowers. If they don't manage to do that, their flowers will slowly decay and their garden will start to turn ugly, and nobody wants an ungly virtual flower garden.

# Use cases
We will now describe all the ways in which the user can use the app.
## Opening the app for the first time
When the user opens the app for the first time, they automatically receive an anonymous account, since having an actual account is not required in order to use the app.
They are then presented with their new and empty flower garden.

## Adding a new habit
The user can navigate to the "New Habit" section, where they will be presented with a list of different categories of habits that they can choose from.
After choosing such a category, they will be taken to the "Habit Setup" section, where they can customize the habit they're about to create.
They can provide a more accurate description of the habit they're trying to form, choose a flower to represent the habit in the Garden, choose a difficulty which will represent how strictly they have to stick to the habit until the flower decays, and create a weekly schedule of times at which they must open the app and confirm that they have (or haven't) done the task associated with the habit.
When the user click the "Plant it!" button, they will be taken back to the "Garden" section and the new habit's flower will be visible there.

## Seeing habit details
The user can navigate to the "Profile" section, where they will see a list of all the habits they are pursuing.
When tapping on a habit from this list, they will be taken to a page that displays information about that habit.
They can change the habit's flower type and description.
At the bottom they will see a history of all the times they have (or haven't) completed the habit's task.

## Adding to a habit's completion history
In the "Garden" section, the user can tap on a flower.
Then they will be taken to a page that allows them to add an entry to the habit's completion history. They can provide an indicator about how they feel about completing (or not) the task as well as write a short description about the completion.
If they do this within a 15 minute range of the habit's schedule, they will be able to mark the habit task as completed.
Otherwise, they will only be able to mark it as not completed.

## Linking an account with a social media account
The user can navigate to the "Settings" section from the "Profile" section.
There they can link their current account with a social media provider like Google, Facebook or Twitter.
After logging in with that social media account, the username and profile picture from the "Profile" section will be updated with the ones from that social media account.
The user can then edit they username.
The user can link their account with all 3 social media providers, as long as those accounts aren't already linked with another Habit Garden accounts.
Now if the user reinstalls the app, they don't have to start with an anonymous account.

## Changing accounts
If the user is logged in with a social media account and would like to log in with another existing account, they must sign out from the "Settings" section. They will become again an anonymous user until they sign in with a social media account that is linked with Habit Garden.

## Deleting an account
The user can choose to delete their account from the "Settings" section.
If the account is anonymous, it is deleted immediately.
If the account is linked with a social media account, the user is asked to log in again before the account is deleted, as a security measure.
After the account has been delete, the user automatically receives a new anonymous account.

## Sending feedback
From the "Settings" section, the user has the option to send us feedback.
When they tap the "Feedback" button, a `mailto:taae0094@scs.ubbcluj.ro` URL will be opened in their default email app in order to send us some feedback.

## Getting help
From the "Settings" section, the user can tap the "Help" button and they will be taken to our website, where there will be an explanation about how the app works and how to use it.

## Kill a flower
If the user no longer wishes to pursue a certain habit, they can go to that habit's detail page and tap the "Kill" button.
Doing so will instantly decay the flower and remove the habit's schedule.
The flower, however, will not be deleted from the garden.

## Viewing other users' gardens
In the "Online" section, the user can see a list of other users and tap on their profile in order to see their flower gardens.

## Leaving messages to other users
In the "Online" section, the user can click on a "Message" button from a user's profile, where they can write a motivational message to that user.

## Seeing messages from other users
In the "Garden" section, above the garden, messages received from other users can be seen as little clouds that last 24 hours.

# Used technologies
The entire backend of this app exists as a [Firebase](https://firebase.com) project.
Firebase is Google's "Backend as a Service" platform.
The app's data is stored in Firebase's Firestore NoSQL database.
The authentification is also handled directly by Firebase.
The infrastructure is, you guessed it, also provided by Firebase.
Therefore, no backend code has been written by us, which is great, since we didn't waste time poorly reinventing the wheel.

The fronted of this app is developed using [Flutter](https://flutter.dev), Google's new UI toolkit for mobile applications. The API for communicating between the Flutter frontend and the Firebase backend is entirely provided by Firebase libraries and SDK's.

All the design and assets of the app have been created using [Figma](https://figma.com), an online vector graphics tool.

All of the code and project planning are stored on [GitHub](https://github.com/andrei-toterman/habit-garden).

# Database "schema"
Firestore, the app's database, is a NoSQL database.
Therefore the is no imposed schema.
It's all one big JSON tree, which is fine, since we don't need complex relational queries.
Nevertheless, we still store the data in a structured way.

    users: [
        {
            uid: string,
            habits: [
                uid: string,
                title: string,
                description: string,
                difficulty: number,
                timestamp: string,
                flower: {
                    health: number,
                    type: string,
                    x: number,
                    y: number
                },
                schedule: [
                    {
                        hour: number,
                        minute: number,
                        days: [boolean]
                    }
                ]
                history: [
                    {
                        uid: string,
                        completed: boolean,
                        entry: string,
                        mood: number,
                        timestamp: string
                    }
                ]
            ],
            messages: [
                {
                    uid: string,
                    message: string,
                    timestamp: string,
                }
            ]
        }
    ]

# Code structure
Now we will present how the code for the Flutter app is structured.

## Models
The `models` folder contains all the used model classes. They are direct representations of the JSON objects from the database.

`flower.dart` holds the data needed to represent a flower from the garden

    class Flower {
        // the type and the health combined will identify the associated asset
        // i.e.  rose_3.png
        final String type;
        final int health;
        // alignment inside garden, between 0 and 1
        final double x, y;
    }

`schedule_entry.dart` hold the data about an element from a habit's schedule list

    class ScheduleEntry {
        final int hour;
        final int minute;
        // a list of 7 bools
        // represeting if the corresponding day of the week is included in the schedule
        final List<bool> days;
    }

`completion_status.dart` holds the data about an element from a habit's completion history

    class CompletionStatus {
        final bool completed;
        // a short description about the habit completion
        final String entry;
        // mood level, from 0 to 4
        final int mood;
        final DateTime timestamp;
    }

`tracked_habit.dart` holds the data about a habit from a user's list, as well as several methods for updating that data.

    class TrackedHabit 
        final String id;
        final String title;
        final String description;
        final List<ScheduleEntry> schedule;
        final Flower flower;
        final DateTime timestamp;
        final int difficulty;

        changeFlowerCoords(double x, double y);

        changeFlowerType(String type);

        changeDescription(String description);

        addCompletionStatus(CompletionStatus status);

        // sets flower health to 1 and clears the schedule list
        kill();

        // checks if the habit's schedule is within a 15 minutes range of the current time
        bool get isActive;

        // returns the habit's completion history from the database
        // as it is not stored in the model itself
        Future<Iterable<CompletionStatus>> get history async;
    }

## Screens
The `screens` folder contains several subfolders, one for each page inside the app.
Each such folder contains a `widgets` subfolder where all the page's widgets are implemented in separate files, a `.dart` file with the same name as the folder which puts together all those widgets, and, if needed, a ViewModel `.dart` file for that page.
Briefly, those screens are:

- `garden` represents the main screen of the app, where the flowers are shown.
- `habit_completion` represents the page where the user adds a completion status to the habit history
- `new_habit_list` represents the page from which the user can choose a habit category for a new habit
- `online` represents the page where the user can see and interact with other users
- `profile` represents the profile page where the user can see their list of habit and profile information
- `settings` represents the settings page where the user can link/unlink/delete/sign out of their account, as well as provide feedback and get help
- `setup_new_habit` represents the setup screen for a new habit
- `tracked_habit_info` represents the description page of a habit, where the user can change the description and flower type and see the habit's completion history

## Navbar
`navbar.dart` holds a widget that is present in most of the app's screens and represents the bottom navigation bar.

## Titlebar
`titlebar.dart` holds a widget that is present in most of the app's screens and represents the top title bar.

## Styles
`styles.dart` hold various styling options, similarly to a CSS file.

## Authentification Service
The `auth.dart` file holds a class that wraps the Firebase Authentification library. It contains methods for linking and unlinking with social media, deleting the account, changing user information, and most importantly it provides a stream of user state changes that other parts of the app can listen and react to.

## Database Service
The `database.dart` file holds a class that wraps the Firebase Firestore library. It listens to the stream provided by the Authentification Service in order to keep track of the current user's UID, so other parts of the app that use the Database don't have to worry who is the current user. It provides all the needed methods for updating the data, as well as fetching data and creating stream of data changes that parts of the UI can listen and react to in real time.

## Main file
The entry point of the app is obviously in `main.dart`. It is responsible for initializing all the Firebase services and wrapping them in classes that can be accessed throughout the app. Then it initializes the Flutter engine and the app starts.

## Assets
All the assests of the app are stores in the `assets` folder in the following way:
- `flowers` is a folder containing the flower pictures, which are store in a `{type}_{health}.png` format
- `icons` holds the SVGs for all the icons used in the app
- `titlebars` holds the SVGs for all the background shapes used as title bars
- `garden.svg` is the shape used as the garden from the main screen
- `icon.png` is the app icon displayed in Android

[title]: title.png


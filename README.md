<p align = center>
<img src = "https://github.com/Zalezny/outfit_flutter/assets/65240240/69ece6b0-d3bb-4151-af3a-366e1c4ad358" width="600"/>
</p>

Outfit App developed for Katya RG Leotards, a two-person company specializing in creating gymnastics leotards. The aim of the application is to facilitate registration and gather information about the time it takes to create the leotards.

The application is initially intended for Android, with the possibility of later expanding to iOS. It utilizes REST API data and synchronizes with a local Isar database (the demo version only has a local database).


## Installation

First, you need to clone the application. Then, switch to the demo branch: `git checkout demo` (a branch where there are no errors due to hidden files) and attach the application in the compiler.

## Technology

Used libraries:

- bloc: State management for the application.
- isar: Local database utilized in the project.
- get_it/injectable: Dependency injection handling.
- http: REST API handling.
- intl: Date handling.
- shared_preferences: Local storage for storing changes.
- nested_scroll_views: Handling nested scrolls (in this case, TabBar and listView.builder).
- flutter_background_service: Background and foreground service handling for the stopwatch.
- flutter_background_service_android: Service handling for Android.
- awesome_notifications: Handling foreground local notifications and customization for the stopwatch.
- permission_handler: Permission handling for notifications >= API33.
- freezed: Autogeneration of DTO files handling.
- pin_code_fields: UI for pin code input.
- fluttertoast: UI for informative toasts.
- flutter_picker: Picker for selecting time.
- build_runner: Build handling for freezed and injectable.

There are three bloc classes in the project:

- OutfitBloc: Manages the list of outfits and handles operations such as deletion, addition, and API retrieval.
- WorkTimeBloc: Manages the list of work times for each outfit and handles operations such as deletion, addition, and API retrieval. This bloc is further divided into two mixins: MomWorkTimeBloc and KatyaWorkTimeBloc.
- StopwatchBloc: Manages stopwatch functionality and communicates with the WorkTimeBloc to save the elapsed time.

For handling REST API requests, the project utilizes the division into folders: connections, dto, exceptions, and services, along with the html library.


## Architecture scheme

<p align = center>
<img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/81dfbf5a-5d7c-40c2-8c2b-2fbf8d09ad9e" >
</p>

## Screenshots

<p align = center>
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/90f4e197-7157-472c-95fe-94224746eb2b" alt="Screenshot 0" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/6f285039-7fdc-4d9f-a5d4-ccbcb0d9330f" alt="Screenshot 1" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/c6e8f7f1-3b23-415f-9cef-f41070210745" alt="Screenshot 2" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/8f95c879-92f7-4d52-9e0a-87284628060d" alt="Screenshot 3" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/fe326415-ae39-4aee-919e-d77c91ade357" alt="Screenshot 4" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/29bc354f-ebab-477f-8a2e-64cda42231a0" alt="Screenshot 5" width="350">
&nbsp
  <img src="https://github.com/Zalezny/outfit_flutter/assets/65240240/925cf9c4-5149-417e-9740-51e1abc10957" alt="Screenshot 6" width="350">
</p>



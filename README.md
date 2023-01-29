# Astro 🧑‍🚀

Briefly, the challenge was to:
- Consume an API
- Display the resulting items in a list
- Support filtering of the list by a given criteria
- When an individual item is tapped, navigate to a details view

## My thought process

After understanding the requirements, I used the provided Swagger docs to ensure the astronaut endpoint was sufficient for the task.

I did encounter an issue with filtering on the **/2.2.0/astronaut** endpoint, whereby no filtering was applied and all results were returned. I used a **nationality** filter example provided by the Swagger docs to confirm the issue - the docs also do not list **status** filters on the Parameters list, so I assumed filtering may have temporarily been disabled by the developers.

Filtering by astronaut **type** was however possible, so I used this as a filtering criteria instead.

After deciding on an app architecture (detailed in the App Architecture section below) I selected two dependencies to use, both installed via their recommended installation method, CocoaPods:
- [SwiftGen](https://github.com/SwiftGen/SwiftGen) - to ensure our images, colours and localisable strings are type-safe, and accessible via automatically generated Asset and L10n enums respectively.
- [SwiftLint](https://github.com/realm/SwiftLint) - to enforce community-recognised Swift styling and conventions across the project.

The Xcode project was created using a SwiftUI interface and lifecycle, as this most closely matches the route I believe Glint are taking!

My first task was to create a basic, protocol-based networking layer, APIServiceProtocol, using [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html). Being protocol-based allows us to ‘blueprint’ data services we may create in the future, ensuring a single source of truth for network requests. Concurrency’s Async/Await was used primarily to simplify testing asynchronous code (which often comes with a lot of bloat, (think Expectations in XCTest), although the non-closure based syntax is also cleaner and guarantees the result is handled in a single downstream call site.

After creating our AstroService to fetch from **/2.2.0/astronaut**, I created AstroRepository to encapsulate logic for translating domain layer information/state into something that can be used to request from our remote (or local) database.

A Configurations.plist was used to store our https://lldev.thespacedevs.com base url environment variable.

Following this, I:
- Built a basic list displaying astronauts, via AstroListView and AstroListViewModel
- Added SDWebImageSwiftUI via Swift Package Manager to asynchronously handle image download and caching
- Added the ability to filter the list by astronaut type, via AstroListView
- Added the ability to view individual astronaut details, via AstroDetailView

## App architecture

The app was built using MVVM as the design pattern of choice. My usual go-to in UIKit projects is MVVM-C, although as navigation is built into the View in SwiftUI, adding a Coordinator felt like over-engineering a solution and an unnecessary abstraction.

I’ve previously worked with VIPER, which felt like a great idea at the time but the additional Interactor layer became really cumbersome to make changes to and ended up affecting development speed. I find that MVVM is a good balance of testability, abstraction and promotes single responsibility.

![App Architecture](https://user-images.githubusercontent.com/123869119/215353612-51f314e8-3012-4e8e-9ae7-9473e98e5b61.jpg)

As illustrated above, the architecture is heavily protocol-based to improve testability - we can easily inject a mocked version of the Repository for example, which we do to test our AstroListViewModel behaves correctly when receiving (mock) data.

It’s also worth noting that the arrows are in a single direction - of the higher-level modules, ensuring dependency inversion. The View Model does not hold knowledge about the View, the Repository does not hold knowledge about the View Model, and the Service (database) does not hold knowledge about the Repository.

The local database is shown for illustration purposes.

I use the repository pattern to ensure domain objects remain persistence agnostic.

Finally, a project-wide MARK structure is used to improve readability/speed.

## If I had more time/Future considerations

- AstroFiltersView would be populated using the **/2.2.0/config/astronauttype/** endpoint, instead of hardcoding AstronautTypeDescription.
- AstroFilterView would have its own View Model to isolate logic, ensuring we do not expose AstroListViewModel methods to the modal.
- Errors would not be printed to console - we should prefer notifying the user when errors occur, as well as sharing details about the error with our observability platform (i.e. Sentry).
- Loading states - we should ensure users are aware when an action is in progress, as per the [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/patterns/loading/)
- Accessibility support
- Project modularisation - not something I’ve tackled before, but if I had more time I would’ve modularised the project as I like the idea of isolating development into packages to avoid conflicts and improve compile time!

## Notes
- ProgressView bug - during scroll on AstroListView, the ProgressView shows during the first fetch then fails to show for subsequent fetches. Switching to a Text View fixes the issue. I'll see if I can figure out what's going on!
- I would not store Configurations.plist in source control. Due to its sensitive nature, we may decide to store it as a GitHub Secret in our repository, or use a service such as Google Cloud’s Secret Manager via Firebase Cloud Functions to fetch configurations securely at runtime.
- I have added the Pods folder to source control to allow you to build the project without any configuration, although usually I would add the /Pods folder to gitignore.

## Conclusion
I hope this shows that, although I have been working on a UIKit-based app, I am able to quickly adapt to the challenge at hand.

I also really enjoyed the task! Look forward to hopefully discussing it with you.

George

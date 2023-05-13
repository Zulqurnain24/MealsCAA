# MealsCAA #
It is an app made with swiftui &amp; combine to demonstrate my attempt at clean architecture approach

<img width="740" alt="Screenshot 2023-05-13 at 4 50 44 PM" src="https://github.com/Zulqurnain24/MealsCAA/assets/6280238/7b04c60d-bc07-4883-a3dd-68aed6a3477b">

## Keypoints ##
As seen from the onion diagram, the layers of the application are arranged in a concentric manner, where each layer depends on the layer inside of it. The core of the application is the domain layer, which contains the business logic of the application. This layer is independent of the UI framework, presentation layer, and data sources.

The use case/logic layer is responsible for orchestrating the interaction between the presentation layer and the domain layer. This layer is also independent of the UI framework and data sources.

The presentation layer is responsible for rendering the user interface using SwiftUI, and it communicates with the use case/logic layer to get data and update the UI accordingly.

The UI framework layer contains the implementation details of SwiftUI and is external to the application. It communicates with the presentation layer to render the UI.

Finally, the data sources layer is responsible for fetching and storing data from external sources, such as databases or APIs. This layer communicates with the use case/logic layer to provide data.

By separating the layers of the application in this way, Clean Architecture with SwiftUI and Combine promotes maintainability, testability, and scalability. It also allows for easy replacement of external dependencies, since they are isolated in the outermost layer of the application.

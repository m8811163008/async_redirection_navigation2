# async_redirection_navigation2

A flutter project to show async redirection with go_router package.

This scenario demonstrates how to use redirect to handle a asynchronous
sign-in flow.

The `StreamAuth` is a mock of remote server sign in. The app wraps it with an
InheritedNotifier, StreamAuthScope, and relies on
`dependOnInheritedWidgetOfExactType` to create a dependency between the
notifier and go_router's parsing pipeline.
When StreamAuth broadcasts new event, the dependency will cause the go_router to reparse the current url
which will also trigger the redirect.

This is the mermaid diagram of UML(Unified modeling language) of AuthSream that mocks the auth services.
![mermaid-diagram-2023-04-30-111836](https://user-images.githubusercontent.com/20933055/235344290-c17186fe-9967-42cd-be66-fbab1f7d68d4.png)

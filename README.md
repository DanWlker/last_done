# last_done

A Flutter project to record when you last done something, intended as a testing ground for new Flutter features and various interesting packages.

## TODOs

1. riverpod 2.0
2. flutter_animate
3. Theme switching

## Getting Started

Before starting the project, start riverpod generator:

    dart run build_runner watch -d 

## Special Notes

### Flutter

1. `ListView.builder` can return null to indicate last page / no more item

### Riverpod

1. Only case where we use `ref.read` is in onPressed
2. Use `someProvider.select((value) => value.XXX)` to optimize if only one value in the provider is needed, no need to use read
3. Breaking down widgets into smaller `ConsumerWidget` and using riverpod to access state inside allows optimization. This is because the widget constructor can be a `const` constructor as it does not need any parameters passed into it. Thus, when something changes in the parent widget, the widget marked with `const` will not be rebuilt.
4. Provider functions cannot store state, but provider classes can store state, ex. the number for a counter 0, 1, 2, 3 etc.

### Flutter animate

### Theme

# Page Transition Effects

## Null-Safety, Dart 3, with zero external dependencies

### IOS, Android, Linux, Mac, Web, Windows ready

Beautiful animations for Page Transition. Supports PushReplacement.

## Getting Started

This package is simple to use. Every single animation contains default values that look beautiful, but you can change properties to accomplish your needs.

## Animations

- FadeIn
- SlideUp
- SlideDown
- SlideLeft
- SlideRight

## Example: 01-Basic

```
home: Scaffold(
    body: Center(

        child: ElevatedButton(
            onPressed: () => PageTransitionEffects(
                context: context,
                page: const MySecondPage(),
                animation: AnimationType.slideDown,
                duration: const Duration(milliseconds: 800),
                replacement: true,
            ),
            child: const Text('Go to Next Page'),
        ),

    ),
),
```

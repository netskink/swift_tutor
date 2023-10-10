#  HWS Day 13

## Question

This is a copy of a response to my question on the HackingWithSwift Slackworkspace.

I asked:

```
I’m on day 14 (whoops! that was really day 13) of hacking with SwiftUI.  The quote.trim() is giving me a “trimmed” result but print (quote.trim()) is giving () result.  Why?
```

## Answer

I got an answer from Pawel Lopusinski.

Just for context, we are talking about trim() as defined as such :

```
extension String {
  mutating func trim() {
    self = self.trimmed()
  }
}
```
right?

So the reason for the behaviour you are seeing is that trim() changes the String “in place” - it doesn’t return a new one.


So when you do this :

```
var text = "   something"
text.trim()
// from this place text == "something"
```

everything is simple and works.

But, when you call this method as an argument to another function, things get a tad 
bit more complicated because we are actually more interested in the return value of the method when used in as an argument.


```
print(text.trim())
// from this place text == "something"
```


So what happens here is that :
* `trim()` will still be called, and text will still be modified
* but `print` doesn’t “see it”, because it’s argument (the thing to print) is a return value of the `trim()` call

And since “no return value” in Swift actually means “`Void` return value” and `Void` is defined as an empty tuple - `()` - this is what gets printed.

You could write the function in a verbose way :

```
mutating func trim() -> Void {
// or
mutating func trim() -> () {
```

which makes the behaviour a little bit easier to understand.

Moreover - nothing in Swift would prevent you from doing this :

```
let result = text.trim()
```

And as you probably are guessing right now `result` won’t hold the trimmed text. It will hold 
that `Void`/`()` - but fortunately when you’d try to use it like this then Xcode throws a nice warning :

```
Constant 'result' inferred to have type '()', which may be unexpected
```

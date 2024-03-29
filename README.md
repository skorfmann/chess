# Representing a Chess Board

## Getting started

```
bundle install
bundle exec rake
open doc/index.html
```

Note: only tested under macosx and ruby 1.9.3

## System Requirements

The implemented system shall provide the following functionality:

Maintain the state of a chess board (an 8×8 grid), including the position of pieces on the board.
Provide an application programming interface to position the pieces on the board and query the state of the board.

### The required operations are:

Move a piece from one position to another. If a piece already exists at the destination position it is removed first.
Remove a piece that is at a specified position on the board.
Reset the position of pieces. The board is reset ready for the start of a new chess match.
Return the type of piece that’s at a specified position on the board. Note that there needs to be a way of reporting that the specified position is empty.

### Support the following types of chess pieces:

- King
- Queen
- Bishop
- Knight
- Rook
- Pawn

Support two teams – black and white.

## Explanation

The requirements above are a reasonably formal set of specifications for the component we’re going to develop in this exercise. While they certainly have some holes in them and some ambiguities, they are reasonably similar to the set of system requirements programmers are often given.

We want to take care of the basic ability to move pieces around the chess board and keep track of where they are. We need to be able to create a board with the pieces in the standard positions for a game of chess and then move pieces about the board. Don’t worry about making sure that the moves are actually allowed in a game of chess.

## Testing

Every good programmer writes a lot of tests to make sure the code functions correctly. It’s usually a good idea to write your tests before you write the actual code so that as you go along, you get instant feedback on whether or not your code is doing the right thing. It also helps design your code as code that’s easy to test, tends to be better designed and easier to use and maintain.

Start writing your tests based around each item in the system requirements. You can either write down the tests and then perform them manually, write a simple program that runs through the tests automatically or learn to use a testing framework like JUnit. Using an existing testing framework is an excellent idea for a lot of reasons but it can be daunting when you’re first getting started so don’t panic about it unless you particularly want to.

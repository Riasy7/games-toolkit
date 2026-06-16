# my game toolkit // lib of tools

Simple start kit for building games in love2d using Lua. The main goal of this project is to keep things systematic, modular, and decoupled so that my code doesn't turn into a giant mess of spaghetti as a game grows.

Instead of building a game with specific features, this is systems that are abstracted to work for any games. I'm mainly making this to learn and for fun.

### How it works

Instead of putting all the game logic into few giant files, this toolkit splits the engine into separate and reusable systems

### LAyout
- `toolkit/` - core tools like state manager and input mapper, etc..
- `game/states/` - actual game screen like main menu, sandbox env, etc..
- `main.lua` - entry point that connects everything to the engine

So far I've done a State Manager and an Input Manager. The first one basically handles switching between different screens. The second one is an event-driven systen where keys maps t ogame actions to keep it abstract and lcean. it checks a specific key config and allows any type of controls to work in the future.

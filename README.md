# 50.002-Computational-Structure

## Design
### Description of the Game

This game is an alternate button game where players gain points by pressing the correct button and lose points when they press the wrong button. There are two buttons for each player - one yellow and one blue. At each turn, the correct button would either be blue or yellow, and the turn ends when any button is pressed, and the correct button for the next turn would be the other button (ie if the correct button for the previous turn was yellow, the correct button would now be blue).

### Design Inspirations
The game was inspired by a game that one of our members was making for their internship company. In that game, players alternate left and right button presses to make their character climb the tower. Obstacles are placed in the game, and hitting them causes the player to lose lives. Players win by reaching the top of the tower before the timer ends. 

Inspired by this game, we improved it through the following means:
- Change the game to 2 player mode
  - Fun: an element of interaction with other people
  - Diverse plays: Different people have different strategies, affecting our own gameplay and playing experience. 
- Different modes (Addition/ Subtraction and Multiplication/ Division)
  - Interesting: Players have to strategise when they press their buttons (eg players would not be able to gain points in the Multiplication/ Division if their score is 0, but they can prevent their opponents from gaining points by pressing buttons to change state. 

### User Interface
![Game User Interface](https://raw.githubusercontent.com/chengwee/50.002-Computational-Structure/master/images/UserInterface.png)
Fig 1: User Interface for Game

The user interface includes 4 buttons, 2 three-digit seven-segments, 2 LEDs and 1 two-digit seven-segment. The 4 buttons consist of 2 for each player (1 yellow and 1 blue), for the user to input. The 2 LEDs indicate the mode of the game (Addition/ Subtraction and Multiplication/ Division). The 2 three-digit seven-segments are used to indicate each player’s score, while the 1 two-digit seven-segment is for the timer. 

### Test Scenarios
- Long pressing 1 button is still registered as 1 button press
- Correct button press causes an increase in points
- Wrong button press causes a decrease in points
- Correct button alternates between yellow and blue button at any button input
- Game ends when one player reaches 888 or timer reaches 0, state goes back to IDLE after a countdown of 5 seconds
- In the IDLE state, buttons light up once they are pressed
- The starting state (ie correct starting button) is randomized at every gameplay
- Game starts in Addition/ Subtraction mode
- Game mode changes when game is running
- In Addition/ Subtraction mode, a correct button press increases the presser’s score by 1
- In Addition/ Subtraction mode, a wrong button press decreases the presser’s score by 1
- In Multiplication/ Division mode, a correct button press doubles the presser’s score
- In Multiplication/ Division mode, a wrong button press halves the presser’s score

## Game Play
### Rules
1. There are a total of 2 game modes: Addition/Subtraction and Multiplication/Division.
2. The game will always start from the Addition/Subtraction mode such that the players are able to start gaining points. (As it will not be possible for players to have a change of points should the game start from Multiplication/Division mode).
3. The game will switch between the two modes at random intervals. 
4. The correct button will alternate between the blue and yellow buttons at each button press. 
5. Pressing the wrong button results in a decrease in points.
6. The player who first hits 888 points before the timer ends will win the game. If neither player manages to hit 888 points before the timer ends, the player with higher points at the end of the game wins. 

### How to Play
1. To start the game, press all 4 buttons on the board.  
2. In order to gain points, the player will have to press the correct button, before the other player does. (i.e. If the correct button state is ‘Blue’, the player that presses the blue button first will have an increase in points. And the next correct button state will be ‘Yellow’)
3. Pressing the wrong button results in a decrease in points.
4. The game ends when the timer reaches 0 or one of the players hit 888 points.

![State Diagram](https://raw.githubusercontent.com/chengwee/50.002-Computational-Structure/master/images/StateDiagram.jpg)
Fig 2: State Diagram for Game

## Circuitry Design
### Overall Datapath
![Game Datapath](https://raw.githubusercontent.com/chengwee/50.002-Computational-Structure/master/images/GameDatapath.png)
Fig 3: Overall Datapath

![Arithmetic Logic Unit (ALU)](https://raw.githubusercontent.com/chengwee/50.002-Computational-Structure/master/images/GameALU.png)
Fig 4: Elaborate Datapath for Arithmetic Logic Unit (ALU)

The CPU receives player input from the buttons, which are directly fed into the game’s logic circuit. The game’s logic circuit is the main component of our game. It contains the Finite State Machine (FSM) of our game and directs what needs to be sent to the ALU, depending on the game’s state and the users’ inputs.

The output of the ALU will be sent back to the score registers of the 2 players, to update their respective scores to be displayed on their 7-segment score displays. 

The circuit design is an adaption of the Von Neumann Architecture whereby the game’s Program Counter and the Game’s state and registers are integrated into the CPU, instead of having independent registers that direct the machine which set of instructions to read next. 

This is due to the fact that we only have two states while in the game mode, namely ‘Blue’ and ‘Yellow’, which will switch from one to the other at any user input. Thus this design is more effective for our game since the style of control unit + game program counter + game states operation makes the game easier to design and implement. 
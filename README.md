# 7-Up-7-Down
####  Ansh Prakash-(2016CS10367) and Pradyumna Meena -(2016CS10375)
## Detailed description of overall design
First we take input from user using switches and three pushbuttons one each for initial amount of both players and one for bet amount. Then random number is generated using RNG. After that we provide information about which player is betting on which side of seven. Then decider comes into play using comparator , bet_on and comparator. Then subtractor starts to work and the cash amount of each player changes in their respective buffers. We also have a GameOver which tells whether either of the player has zero balance or not. One point to be noted is that we can’t have same set of bets again i.e. say P1 puts a bet on greater than 7 and P2 on less than 7 then on next bet one of the player must change his bet. The next challenge was to implement the display part sequentially as we needed the code to remember the history. So we designed a finite state machine to implement this.This FSM takes care of everything that will be displayed in the code.

### Description of FSM =>
1. Random Number Generator(RNG) : Generates a random number between 2 and 12.
2. Bet_On : Outputs two bits indicating whether the bet is valid or not and other indicates which player betted on greater than seven.
3. Comparator: Outputs 0/1 denoting whether the input bit vector (output of RNG) is greater than 0111 or not.
4. Decider: Outputs 0/1 using output of comparator and Bet_On. It also outputs two bits one indicating who won the bet and other indicating that whether the bet placed was valid or not.
5. Seven segment display : Same as used in Lab-4.
6. Feed_Amount : Register used to store input for amount of player1 and player2.
7. Bet_Register : Register used to store input for bet amount.

### Mappings
#### LEDs =>
1. over : This indicates whether the game is over or not.
2. P1won : This indicates that currently player one is winning.
3. P2won : This indicates that currently player two is winning.
4. invbet : This will tell us whether the bet amount inserted is greater than either of the player’s current amount.
5. invald : This will tell us whether the bet is invalid or not. It works on the condition that both the players bet on different sides of seven.

#### Switches=>
1. P1 : This indicates that whether player one is betting on greater than 7 or not.
2. P2 : This indicates that whether player two is betting on greater than 7 or not.
3. Extra : This is used for transition between random state to the winning player’s state.
4. lifesaver : Helps in taking input so that we don’t end up storing undefined in registers.
5. amounts(11 downto 0) : used for taking input.

### Push Buttons=>
1. pb1 : Used to input player one’s initial amount.
2. pb2 : Used to input player two’s initial amount.
3. pb13: Used to input bet amount.
4. pb4 : Used to reset the random number.
5. pb5 : Used to get random number.

## How to use??
1. Feed initial amount for each player and also the bet amount (using three pushbuttons and switches).
2. Press pb4 to send RNG to a start state and generation of random number will happen by subsequent pressing of pb5.
3. Now using P1 and P2 decide the bet. This will be the very first bet.
4. Now to change bet amount start following steps from third part offirst step.
5. Have fun untill the game is over!!!!!!!!

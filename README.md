# Door Exercise
A computer game usually has many different objects that can be seen and manipulated. One typical object is a door. Whether a player runs through a castle, attacks the forces of an evil empire, or places furniture in a room, a door often comes into play.

A `Door` object can

- display an inscription
  #- method to inscribe the door
  #- method to see the inscription on the door
- be either open or closed, and
  #
  - attribute is open or closed (default? (true/false))
  #- .open? method checks whether it is open
  - door cannot be opened if it is open
  - cannot be closed if it is closed
  - cannot be opened if it is locked & closed
- be either locked or unlocked (default - true/false)
  - door cannot be locked if it is not closed
  - door cannot be locked if it is locked
  #- .locked? checks whether it is locked

Here are some rules about how Doors work:

- Once the writing (inscription) on a Door is set, it cannot be changed
- You may open a Door if and only if it is unlocked and closed
- You may close a Door if and only if it is open
- You may lock a Door if and only if it is unlocked
- You may unlock a Door if and only if it is locked
- You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.

Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.

You should write specs for this class, to achieve at least 90% test coverage (using `simplecov`).

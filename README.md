# Door Exercise
A computer game usually has many different objects that can be seen and manipulated. One typical object is a door. Whether a player runs through a castle, attacks the forces of an evil empire, or places furniture in a room, a door often comes into play.

A `Door` object can

- display an inscription
- be either open or closed, and
- be either locked or unlocked

Here are some rules about how Doors work:

- Once the writing (inscription) on a Door is set, it cannot be changed
- You may open a Door if and only if it is unlocked and closed
- You may close a Door if and only if it is open
- You may lock a Door if and only if it is unlocked
- You may unlock a Door if and only if it is locked
- You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.

Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.

You should write specs for this class, to achieve at least 90% test coverage (using `simplecov`).

METHODS
- get_inscription => displays the inscription
- open_door => opens the door if it's unlocked and closed
- close_door => closes the door if it's open
- lock_door => locks the door if it's closed and unlocked
- unlock_door => unlocks the door if it's locked and closed
- get_status => see if door is open/closed, locked/unlocked, and the inscription

/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/



VAR pet_name = ""
VAR torches = 0
VAR food = 5
VAR hunger = 2


-> memory

== memory ==
Before you stands the cavern of Josh. You came prepared with plenty of food, but you wish your childhood pet was with you now. The cave might be less intimidation then. What was your pet's name?

* [Charlie] 
    ~ pet_name = "Charlie" 
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth


=== hunger_status ===
Your hunger level is {hunger}
+ [Go back] -> cave_mouth
-> END

=== food_status ===
You have {food} food left
+ [Go back] -> cave_mouth
-> END

=== food_eat ===
~ food = food - 1
~ hunger = hunger - 1
You eat some food. You now have {food} food left.
+ [Go back] -> cave_mouth
-> END

=== starve_ending ===
The hunger became too much to bear, so you starved to death.
-> END




== cave_mouth ==
You are at the entrance to a cave. {not torch_pickup:There is a pile of torches on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
+ [Check hunger] -> hunger_status
+ [Check food] -> food_status
+ [Eat some food] -> food_eat
+ [Pick up a torch] -> torch_pickup
* {hunger >= 5} [Starve] -> starve_ending


== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west


{pet_name == "Spot": Spot would love it here in the west| }


+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
~ hunger = hunger + 1
You now have a torch. May it light the way. Picking it up made you hungry
+ [Eat some food] -> food_eat
+ [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
-> END
 Test Case ID      |         1          |
|-------------------|--------------------|
| Name |Start the game                 |
| Description|       The game starts              |
| Pre-conditions| The game is not started |
| Steps| Click on the start button |
| Expected result| The game starts |
| Actual result|  |
| Status | To test |
| Priority | High





 Test Case ID      |         2          |
|-------------------|--------------------|
| Name | Stop the game                 |
| Description|       The game stops when pause button is pressed    |
| Pre-conditions| The game must be started |
| Steps| Press pause button |
| Expected result| The game stops |
| Actual result|  |
| Status | To test |
| Priority | High

 Test Case ID      |         3          |
|-------------------|--------------------|
| Name | Move left                 |
| Description|  Pac-Man must move to the left   |
| Pre-conditions| The game must be started |
| Steps| Press left arrow key |
| Expected result| Pac-Man moves to the left |
| Actual result|  |
| Status | To test |
| Priority | High


 Test Case ID      |         4          |
|-------------------|--------------------|
| Name | Move right                 |
| Description|  Pac-Man must move to the right   |
| Pre-conditions| The game must be started |
| Steps| Press right arrow key |
| Expected result| Pac-Man moves to the right |
| Actual result|  |
| Status | To test |
| Priority | High


 Test Case ID      |         4          |
|-------------------|--------------------|
| Name | Move up                 |
| Description|  Pac-Man must move upwards   |
| Pre-conditions| The game must be started |
| Steps| Press up arrow key |
| Expected result| Pac-Man moves upwards |
| Actual result|  |
| Status | To test |
| Priority | High

 Test Case ID      |         5          |
|-------------------|--------------------|
| Name | Move down                 |
| Description|  Pac-Man must move downwards   |
| Pre-conditions| The game must be started |
| Steps| Press down arrow key |
| Expected result| Pac-Man moves downwards |
| Actual result|  |
| Status | To test |
| Priority | High


 Test Case ID      |         6          |
|-------------------|--------------------|
| Name | Wall collisions                 |
| Description|  Pac-Man and the ghosts must be stopped by the walls   |
| Pre-conditions| The game must be started |
| Steps| Moves toward a wall |
| Expected result| Pac-Man and the ghosts are stopped |
| Actual result|  |
| Status | To test |
| Priority | High

 Test Case ID      |         7          |
|-------------------|--------------------|
| Name | Collisions between Pac-Man and the ghosts                |
| Description|  Pac-Man dies when he touches a ghost   |
| Pre-conditions| The game must be started and a ghost must touch Pac-Man |
| Steps| Make Pac-Man touch a ghost |
| Expected result| Pac-Man dies |
| Actual result|  |
| Status | To test |
| Priority | High


Test Case ID      |         8            |
|-------------------|--------------------|
| Name | Collisions between Pac-Man and the ghosts |
| Description| When Pac-Man eats a power pellet, he can eat the ghosts   |
| Pre-conditions| The game must be started and Pac-Man must eat a power pellet|
| Steps| Make Pac-Man touch a ghost |
| Expected result| The ghost dies |
| Actual result|  |
| Status | To test |
| Priority | High

 

 Test Case ID      |         9            |
|-------------------|--------------------|
| Name | Game Over |
| Description| When Pac-Man runs out of lives, the game stops   |
| Pre-conditions| Pac-Man must have one life remaining|
| Steps| Make Pac-Man touch a ghost |
| Expected result| The game ends |
| Actual result|  |
| Status | To test |
| Priority | High


 Test Case ID      |         10            |
|-------------------|--------------------|
| Name | Next level |
| Description| When Pac-Man eats every dots, he moves to the next level   |
| Pre-conditions| One dot remaining|
| Steps| Eat the last dot|
| Expected result| A new level appear |
| Actual result|  |
| Status | To test |
| Priority | High


 Test Case ID      |         11            |
|-------------------|--------------------|
| Name | Score |
| Description| The score increases when Pac-Man eats a dot   |
| Pre-conditions| Start the game, move on the map|
| Steps| Eat a dot|
| Expected result| The score increases and to dot desapears
| Actual result|  |
| Status | To test |
| Priority | High


 Test Case ID      |         12            |
|-------------------|--------------------|
| Name | Increase lives |
| Description| Pac-Man earns a life every 10K points won   |
| Pre-conditions| Start the game, earn 1Ok points|
| Steps| Eat dots and ghosts|
| Expected result| A life is given to Pac-Man
| Actual result|  |
| Status | To test |
| Priority | Medium


 Test Case ID      |         13            |
|-------------------|--------------------|
| Name | Tunnels |
| Description| When Pac-Man enters in a tunnel, he's teleported in the other one   |
| Pre-conditions| Start the game |
| Steps| Go through a tunnel|
| Expected result|Pac-Man is teleported on the opposite side of the map|  |
| Status | To test |
| Priority | Medium


 Test Case ID      |         14           |
|-------------------|--------------------|
| Name | Bonuses |
| Description| When Pac-Man eats a bonus, the score increases  |
| Pre-conditions| Start the game |
| Steps| Eat a bonus fruit|
| Expected result|Pac-Man earns point as he eats bonuses|  |
| Status | To test |
| Priority | Low


 Test Case ID      |         15           |
|-------------------|--------------------|
| Name | Ghosts' scatter mode|
| Description| Verify ghosts behaviour when in scatter mode |
| Pre-conditions| Start the game |
| Steps| Wait for the ghosts to change behaviour|
| Expected result| The ghosts are in scatter mode|  |
| Status | To test |
| Priority | Low


 Test Case ID      |         16           |
|-------------------|--------------------|
| Name | Ghosts' chase mode|
| Description| Verify ghosts behaviour when in chase mode |
| Pre-conditions| Start the game |
| Steps| Wait for the ghosts to change behaviour|
| Expected result| The ghosts are in chase mode|  |
| Status | To test |
| Priority | Low



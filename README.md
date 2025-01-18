# ActionScript 3 Collision Detection Bug
This repository demonstrates a common bug in ActionScript 3 related to inaccurate collision detection when dealing with objects that have transformations (rotation, scaling).  The `getBounds()` method is used incorrectly leading to false negatives in collision detection.

## Bug Description
The `checkCollision` function uses `getBounds()` to get the bounding rectangle of two display objects. However, `getBounds()` returns the bounding box relative to the object's parent. If the parent objects are transformed, the bounding boxes won't accurately reflect the objects' on-screen positions, leading to incorrect collision detection.

## Solution
The solution involves using the `getRect()` method of the display object to get the global bounds and handling the transformation matrix of the object for accurate collision detection.
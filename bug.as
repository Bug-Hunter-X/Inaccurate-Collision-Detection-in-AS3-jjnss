function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var rect1:Rectangle = obj1.getBounds(obj1.parent);
  var rect2:Rectangle = obj2.getBounds(obj2.parent);
  return rect1.intersects(rect2);
}

// ... later in the code ...

if (checkCollision(myMovieClip, myOtherMovieClip)) {
  trace("Collision detected!");
}

//Problem: The getBounds() method in ActionScript 3 returns the bounding box relative to the object's parent.  If the parent objects are nested or have transformations (rotation, scaling), the bounding boxes won't accurately reflect the objects' on-screen positions, leading to inaccurate collision detection.

//Example:
//myMovieClip is rotated 45 degrees. getBounds() will give you a bounding box that's not rotated.  The collision check will fail even if the rotated movie clips visually overlap.
function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  // Get the global bounding rectangle using getRect()
  var rect1:Rectangle = obj1.getRect(obj1.stage);
  var rect2:Rectangle = obj2.getRect(obj2.stage);

  return rect1.intersects(rect2);
}

//Alternative solution using a transformation matrix for more precise collision
function checkCollisionWithTransform(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var bounds1:Rectangle = obj1.getBounds(obj1.parent);
  var bounds2:Rectangle = obj2.getBounds(obj2.parent);
  var matrix1:Matrix = obj1.transform.matrix;
  var matrix2:Matrix = obj2.transform.matrix;

  //Transform each corner and recalculate the bounding box
  var points1:Array = [new Point(bounds1.x, bounds1.y), new Point(bounds1.x + bounds1.width, bounds1.y), new Point(bounds1.x, bounds1.y + bounds1.height), new Point(bounds1.x + bounds1.width, bounds1.y + bounds1.height)];
  var points2:Array = [new Point(bounds2.x, bounds2.y), new Point(bounds2.x + bounds2.width, bounds2.y), new Point(bounds2.x, bounds2.y + bounds2.height), new Point(bounds2.x + bounds2.width, bounds2.y + bounds2.height)];

  for each (var point:Point in points1) {
    point = matrix1.transformPoint(point);
  }
  for each (var point:Point in points2) {
    point = matrix2.transformPoint(point);
  }

  //Recalculate bounding boxes from transformed points
  var transformedBounds1:Rectangle = getBoundsFromPoints(points1);
  var transformedBounds2:Rectangle = getBoundsFromPoints(points2);
  
  return transformedBounds1.intersects(transformedBounds2);
}

function getBoundsFromPoints(points:Array):Rectangle {
  var minX:Number = points[0].x;
  var minY:Number = points[0].y;
  var maxX:Number = points[0].x;
  var maxY:Number = points[0].y;
  for each (var point:Point in points) {
    minX = Math.min(minX, point.x);
    minY = Math.min(minY, point.y);
    maxX = Math.max(maxX, point.x);
    maxY = Math.max(maxY, point.y);
  }
  return new Rectangle(minX, minY, maxX - minX, maxY - minY);
}

// ... later in the code ...

if (checkCollision(myMovieClip, myOtherMovieClip)) {
  trace("Collision detected!");
}
//or
if (checkCollisionWithTransform(myMovieClip, myOtherMovieClip)) {
  trace("Collision detected!");
}
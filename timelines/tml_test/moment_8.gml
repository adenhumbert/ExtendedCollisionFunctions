///@desc collision_rectangle_ext(x1, y1, x2, y2, objs, prec, notme, [suchthat])

// Create test objects
var t1a = instance_create_layer(x-200, y-200, layer, objTarget1);
var t2a = instance_create_layer(x-200, y-200, layer, objTarget2);
var t1b = instance_create_layer(x+200, y+200, layer, objTarget1); t1b.value = 3;
var t2b = instance_create_layer(x+200, y+200, layer, objTarget2); t2b.value = 5;
var t2c = instance_create_layer(x, y, layer, objTarget2); t2c.value = 4;

// Run tests without conditions
assert_equal(collision_rectangle_ext(x-200, y-200, x-180, y-180, objTarget1, false, true), t1a);
assert_equal(collision_rectangle_ext(x-200, y-200, x-180, y-180, objTarget2, false, true), t2a);
assert_equal(collision_rectangle_ext(x-200, y-200, x-180, y-180, [objTarget2, objTarget3], false, true), t2a);
assert_equal(collision_rectangle_ext(x-200, y-200, x-180, y-180, objTarget3, false, true), noone);
assert_equal(collision_rectangle_ext(x, y, x+20, y+20, objTester, false, false), id);
assert_equal(collision_rectangle_ext(x, y, x+20, y+20, objTester, false, true), noone);

// Run tests with conditions
assert_equal(collision_rectangle_ext(x-200, y+200, x-180, y+180, [objTarget1, objTarget2, objTarget3], false, true, valueBiggerThanMe), noone);
assert_equal(collision_rectangle_ext(x-200, y-200, x-180, y-180, pobjTarget, false, true, valueBiggerThanMe), noone);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, pobjTarget, false, true, valueBiggerThanMe), t2b);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, [objTarget2, objTarget3], false, true, valueBiggerThanMe), t2b);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, [objTarget2], false, true, valueBiggerThanMe), t2b);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, [objTarget1, objTarget3], false, true, valueBiggerThanMe), noone);
assert_equal(collision_rectangle_ext(x, y, x+20, y+20, pobjTarget, false, true, valueBiggerThanMe), noone);

// Run tests with conditions and argument
assert_equal(collision_rectangle_ext(x-200, y+200, x-180, y+180, [objTarget1, objTarget2, objTarget3], false, true, [valueEqualTo, 5]), noone);
assert_equal(collision_rectangle_ext(x-200, y-200, x-180, y-180, pobjTarget, false, true, [valueEqualTo, 5]), noone);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, pobjTarget, false, true, [valueEqualTo, 5]), t2b);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, [objTarget2, objTarget3], false, true, [valueEqualTo, 5]), t2b);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, [objTarget2], false, true, [valueEqualTo, 5]), t2b);
assert_equal(collision_rectangle_ext(x+200, y+200, x+180, y+180, [objTarget1, objTarget3], false, true, [valueEqualTo, 5]), noone);
assert_equal(collision_rectangle_ext(x, y, x+20, y+20, objTester, false, false, [valueEqualTo, 4]), id);
assert_equal(collision_rectangle_ext(x, y, x+20, y+20, objTester, false, true, [valueEqualTo, 4]), noone);
assert_equal(collision_rectangle_ext(x, y, x+20, y+20, [objTester, pobjTarget], false, true, [valueEqualTo, 4]), t2c);

// Destroy test objects
with (objTarget1) instance_destroy();
with (objTarget2) instance_destroy();

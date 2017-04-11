/*
* Copyright (c) 2006-2007 Erin Catto http://www.gphysics.com
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/

package Box2D.Dynamics{


	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Dynamics.Contacts.*;
	import Box2D.Dynamics.*;
	import Box2D.Common.Math.*;
	import Box2D.Common.*;


	/// Implement this class to get collision results. You can use these results for
	/// things like sounds and game logic. You can also get contact results by
	/// traversing the contact lists after the time step. However, you might miss
	/// some contacts because continuous physics leads to sub-stepping.
	/// Additionally you may receive multiple callbacks for the same contact in a
	/// single time step.
	/// You should strive to make your callbacks efficient because there may be
	/// many callbacks per time step.
	/// @warning The contact separation is the last computed value.
	/// @warning You cannot create/destroy Box2D entities inside these callbacks.

	public class b2ContactListener {

		public var collz:Array = new Array;


		public function b2ContactListener() {
			clear_collisions();
		}

		/// Called when a contact point is added. This includes the geometry
		/// and the forces.
		public virtual function Add(point:b2ContactPoint):void {

		}

		/// Called when a contact point persists. This includes the geometry
		/// and the forces.
		public virtual function Persist(point:b2ContactPoint):void {
			var num1:int;
			var num2:int;
			if (point.shape1.GetBody().GetUserData()!=null) {
				if (point.shape1.GetBody().GetUserData().col==point.shape2.GetBody().GetUserData().col) {
					num1 = point.shape1.GetBody().GetUserData().prog;
					num2 = point.shape2.GetBody().GetUserData().prog;
					if (collz[num1].indexOf(num2)==-1) {
						collz[num1].push(num2);
					}
					if (collz[num2].indexOf(num1)==-1) {
						collz[num2].push(num1);
					}
					//collz[point.shape2.GetBody().GetUserData().prog]=point.shape1.GetBody().GetUserData().prog;
				}
				//trace(point.shape1.GetBody().GetUserData().name+"->"+point.shape2.GetBody().GetUserData().name);
			}
		}

		/// Called when a contact point is removed. This includes the last
		/// computed geometry and forces.
		public virtual function Remove(point:b2ContactPoint):void {
			var num1:int;
			var num2:int;
			var arr_index:int;
			if (point.shape1.GetBody().GetUserData()!=null) {
				if (point.shape1.GetBody().GetUserData().col==point.shape2.GetBody().GetUserData().col) {
					num1 = point.shape1.GetBody().GetUserData().prog;
					num2 = point.shape2.GetBody().GetUserData().prog;
					arr_index = collz[num1].indexOf(num2);
					if (arr_index!=-1) {
						collz[num1].splice(arr_index,1);
					}
					arr_index = collz[num2].indexOf(num1);
					if (arr_index!=-1) {
						collz[num2].splice(arr_index,1);
					}
					//collz[num2].push(num1);
					//collz[point.shape2.GetBody().GetUserData().prog]=point.shape1.GetBody().GetUserData().prog;
				}
				//trace(point.shape1.GetBody().GetUserData().name+"->"+point.shape2.GetBody().GetUserData().name);
			}
		}

		/// Called after a contact point is solved.
		public virtual function Result(point:b2ContactResult):void {

		}
		public function compare(element:*, index:int, arr:Array) {
			return element != -1;
		}
		public function get_collz(el):Array {
			return (collz[el]);
		}
		public function clear_collisions() {
			for (var i=0; i<156; i++) {
				collz[i] = new Array;
			}
		}
	}

}
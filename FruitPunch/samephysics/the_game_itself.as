package {
	import flash.display.Sprite;
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.Joints.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.SimpleButton;
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
	import splash;
	public class the_game_itself extends Sprite {
		public var main_class:the_game;
		var body:b2Body;
		var mouseJoint:b2MouseJoint;
		var m_world:b2World;
		var m_iterations:int=10;
		var m_timeStep:Number=1.0/30.0;
		var contact_listener=new b2ContactListener();
		var blocks_to_remove:Array = new Array();
		var blocks_on_stage:Array = new Array();
		var remove_the_blocks:Boolean = false;
		var score_var:scoreclip = new scoreclip();
		var number_of_shakes:int = 10;
		var score:int = 0;
		var progressive:int=0;
		var level:int = 1;
		var time_left:int = 20;
		var game_over:Boolean = false;
		var time_count:Timer = new Timer(1000);
		var jolly:int = 10;
		var last_score:String = "none";
		//var main_class1:splash = new splash(main_class);
		//var the_banner:banner;
		public var shake_the_screen:Boolean = false;
		public function the_game_itself(passed_class:the_game) {
			//the_banner = new banner(passed_class.loaderInfo.url);
			//addChild(the_banner);
			main_class = passed_class;
			time_count.start();
			addChild(score_var);
			var worldAABB:b2AABB = new b2AABB();
			worldAABB.lowerBound.Set(-100.0, -100.0);
			worldAABB.upperBound.Set(100.0, 100.0);
			var gravity:b2Vec2=new b2Vec2(0.0,10.0);
			var doSleep:Boolean=true;
			m_world=new b2World(worldAABB,gravity,doSleep);
			m_world.SetContactListener(contact_listener);
			// lower static object
			create_box(9,13,9,0.5,0);
			create_box(9,0,9,0.5,0);
			create_box(0,9,0.5,9,0);
			create_box(14,9,0.5,9,0);
			create_level(1);
			// listeners
			addEventListener(Event.ENTER_FRAME, on_enter_frame, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, on_mouse_down);
			time_count.addEventListener(TimerEvent.TIMER, second_passed);
			shakebutton.addEventListener(MouseEvent.CLICK, on_shake_clicked);
			facebook_btn.addEventListener(MouseEvent.CLICK, facebook_btn_clicked);
			gplus_btn.addEventListener(MouseEvent.CLICK, gplus_btn_clicked);
			c1_btn.addEventListener(MouseEvent.CLICK, c1_btn_clicked);
			c2_btn.addEventListener(MouseEvent.CLICK, c2_btn_clicked);
			c3_btn.addEventListener(MouseEvent.CLICK, c3_btn_clicked);
			zopy_logo.addEventListener(MouseEvent.CLICK, zopy_logo_btn_clicked);
			//soundoffbutton.addEventListener(MouseEvent.CLICK, on_soundoff_button_clicked);
		}
		/*public function on_soundoff_button_clicked(event:MouseEvent) {
			main_class1.sound_off();
		}*/
		public function facebook_btn_clicked(event:MouseEvent) {
			var url:String = "https://www.facebook.com/sharer/sharer.php?u=http://zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function gplus_btn_clicked(event:MouseEvent) {
			var url:String = "https://plus.google.com/share?url=http://zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function c1_btn_clicked(event:MouseEvent) {
			var url:String = "http://playcoolonlinegames.com";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function c2_btn_clicked(event:MouseEvent) {
			var url:String = "http://playcoolonlinegames.com";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function c3_btn_clicked(event:MouseEvent) {
			var url:String = "http://playcoolonlinegames.com";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function zopy_logo_btn_clicked(event:MouseEvent) {
			var url:String = "http://zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function on_shake_clicked(event:MouseEvent) {
			if (number_of_shakes>0) {
				shake_the_screen = true;
				number_of_shakes--;
				score_var.update_score(score,jolly,level,number_of_shakes,time_left,last_score);
			}
		}
		public function second_passed(event:TimerEvent) {
			if (progressive<156) {
				time_left--;
				score_var.update_score(score,jolly,level,number_of_shakes,time_left,last_score);
				if (time_left==0) {
					game_over = true;
				}
			}
		}
		public function create_level(l) {
			contact_listener.clear_collisions();
			blocks_on_stage = new Array;
			blocks_to_remove = new Array;
			var random_color:int;
			var bodyDef:b2BodyDef;
			var boxDef:b2PolygonDef;
			for (var j=0; j<13; j++) {
				for (var i=0; i<12; i++) {
					random_color = Math.floor(Math.random()*(level+3))+1;
					if (random_color>8) {
						random_color = Math.floor(Math.random()*8)+1;
					}
					bodyDef = new b2BodyDef();
					bodyDef.position.Set(j+1, i+1);
					boxDef = new b2PolygonDef();
					boxDef.SetAsBox(0.5, 0.5);
					boxDef.friction=1;
					boxDef.density=0.5;
					boxDef.restitution=0;
					bodyDef.userData = new square();
					bodyDef.userData.prog = progressive;
					bodyDef.userData.col = random_color;
					body=m_world.CreateBody(bodyDef);
					body.CreateShape(boxDef);
					body.SetMassFromShapes();
					addChild(bodyDef.userData);
					bodyDef.userData.gotoAndStop(random_color);
					blocks_on_stage.push(progressive);
					progressive++;
				}
			}
			score_var.update_score(score,jolly,level,number_of_shakes,time_left,last_score);
		}
		public function create_box(x_pos,y_pos,x_side,y_side,density) {
			var bodyDef:b2BodyDef;
			var boxDef:b2PolygonDef;
			bodyDef = new b2BodyDef();
			bodyDef.position.Set(x_pos, y_pos);
			boxDef = new b2PolygonDef();
			boxDef.SetAsBox(x_side, y_side);
			boxDef.friction=0.3;
			boxDef.density=density;
			body=m_world.CreateBody(bodyDef);
			body.CreateShape(boxDef);
			body.SetMassFromShapes();
		}
		public function on_mouse_down(evt:MouseEvent):void {
			remove_the_blocks = true;
		}
		public function get_rec_blocks(block:int) {
			var temp:int;
			var temp_array:Array;
			temp = blocks_to_remove.indexOf(block);
			if (temp==-1 && blocks_on_stage.indexOf(block)!=-1) {
				blocks_to_remove.push(block);
				temp_array = contact_listener.get_collz(block);
				temp = temp_array.length;
				for (var i:int=0; i<temp; i++) {
					get_rec_blocks(temp_array[i]);
				}
			}
		}
		private var mousePVec:b2Vec2 = new b2Vec2();
		public function GetBodyAtMouse(includeStatic:Boolean=false):b2Body {
			var mouseXWorldPhys = (mouseX)/30;
			var mouseYWorldPhys = (mouseY)/30;
			mousePVec.Set(mouseXWorldPhys, mouseYWorldPhys);
			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound.Set(mouseXWorldPhys - 0.001, mouseYWorldPhys - 0.001);
			aabb.upperBound.Set(mouseXWorldPhys + 0.001, mouseYWorldPhys + 0.001);
			var k_maxCount:int=10;
			var shapes:Array = new Array();
			var count:int=m_world.Query(aabb,shapes,k_maxCount);
			var body:b2Body=null;
			for (var i:int = 0; i < count; ++i) {
				if (shapes[i].GetBody().IsStatic()==false||includeStatic) {
					var tShape:b2Shape=shapes[i] as b2Shape;
					var inside:Boolean=tShape.TestPoint(tShape.GetBody().GetXForm(),mousePVec);
					if (inside) {
						body=tShape.GetBody();
						break;
					}
				}
			}
			return body;
		}
		public function on_enter_frame(e:Event):void {
			if (!game_over) {
				if (progressive==0) {
					score += jolly*10*level;
					score += number_of_shakes*10*level;
					last_score = "One-crate bonus: "+(jolly*10*level)+"\nShakes bonus: "+(number_of_shakes*10*level);
					level++;
					jolly += 5;
					number_of_shakes += 5;
					create_level(level);
				}
				var current_object:int;
				var object_position:int;
				var object:int;
				var block_under_mouse:int = -1;
				var temp:int;
				var body:b2Body=GetBodyAtMouse();
				var par_score:int;
				if (body) {
					object = body.m_userData.prog;
					get_rec_blocks(object);
				}
				temp = blocks_to_remove.length;
				if (remove_the_blocks) {
					if (temp==1) {
						if (jolly>0) {
							progressive--;
							jolly --;
							time_left = 20;
							score_var.update_score(score,jolly,level,number_of_shakes,time_left,last_score);
						}
						else {
							blocks_to_remove=new Array();
						}
					}
					else {
						if (temp>1) {
							par_score = (temp*(temp-1)+Math.floor(time_left/2))*level;
							score += par_score;
							last_score = "Crate score: "+(temp*(temp-1))+"\nTime bonus: "+Math.floor(time_left/2)+"\nLevel bonus: x"+level;
							progressive-=temp;
							time_left = 20;
							score_var.update_score(score,jolly,level,number_of_shakes,time_left,last_score);
						}
					}
				}
				m_world.Step(m_timeStep, m_iterations);
				for (var bb:b2Body = m_world.m_bodyList; bb; bb = bb.m_next) {
					if (bb.m_userData is Sprite) {
						current_object = bb.m_userData.prog;
						object_position = blocks_to_remove.indexOf(current_object);
						if (object_position!=-1 && remove_the_blocks) {
							blocks_to_remove.splice(object_position,1);
							blocks_on_stage.splice(blocks_on_stage.indexOf(bb.m_userData.prog),1);
							removeChild(bb.m_userData);
							bb.m_userData = null;
							m_world.DestroyBody(bb);
						}
						else {
							if (object_position!=-1) {
								bb.m_userData.alpha = 0.5;
								blocks_to_remove.splice(object_position,1);
							}
							else {
								if (shake_the_screen) {
									bb.ApplyImpulse(new b2Vec2(Math.random()*10-5, -5.0), bb.GetWorldCenter());
									bb.ApplyTorque(Math.random()*100-50);
								}
								bb.m_userData.alpha = 1;
							}
							bb.m_userData.x = bb.GetPosition().x * 30;
							bb.m_userData.y = bb.GetPosition().y * 30;
							bb.m_userData.rotation = bb.GetAngle() * (180/Math.PI);
						}
					}
				}
				remove_the_blocks = false;
				shake_the_screen = false;
			}
			else {
				alpha -=0.05;
				if (alpha<0) {
					removeEventListener(Event.ENTER_FRAME, on_enter_frame);
					removeEventListener(MouseEvent.MOUSE_DOWN, on_mouse_down);
					time_count.removeEventListener(TimerEvent.TIMER, second_passed);
					main_class.show_game_over(score);
				}
			}
		}
	}
}
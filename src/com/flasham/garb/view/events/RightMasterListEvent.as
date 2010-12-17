package com.flasham.garb.view.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class RightMasterListEvent extends Event
	{
		public static const Up_DATA:String = "updata" ;
		
		private var _data:ArrayCollection;
		
		public function get data():ArrayCollection{ return this._data };
		
		public function RightMasterListEvent(type:String, data:ArrayCollection , bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._data = data;
		}
		
		override public function clone():Event
		{
			return new RightMasterListEvent(type, data , bubbles, cancelable);
		}
	}
}
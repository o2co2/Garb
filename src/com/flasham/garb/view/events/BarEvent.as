package com.flasham.garb.view.events
{
	import flash.events.Event;
	
	public class BarEvent extends Event
	{
		public static const BAR_UPDATA:String = "bardata";
		public static const COMPLETE:String = "complete";
		
		/**
		 *加载比率 
		 */		
		private var _ratio:int;
		
		public function get ratio():int
		{
			return this._ratio;
		}
		
		public function set ratio(_ratio:int):void
		{
			this._ratio = _ratio;
		}
		
		public function BarEvent(type:String, ratio:int , bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._ratio = ratio;
		}
		
		override public function clone():Event
		{
			return new BarEvent(type,ratio,bubbles,cancelable);
		}
	}
}
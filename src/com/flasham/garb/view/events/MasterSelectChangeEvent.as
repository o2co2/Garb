package com.flasham.garb.view.events
{
	import com.flasham.garb.model.vo.RSSXML;
	import flash.events.Event;

	public class MasterSelectChangeEvent extends Event
	{
		public static const SELECT_CHANGE:String="selectchange";

		public function MasterSelectChangeEvent(type:String, data:RSSXML, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._data=data;
		}

		private var _data:RSSXML

		public function get data():RSSXML
		{
			return _data;
		}

		override public function clone():Event
		{
			return new MasterSelectChangeEvent(type, data, bubbles, cancelable);
		}
	}
}
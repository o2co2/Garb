package com.flasham.garb.model
{
	import org.robotlegs.mvcs.Actor;

	public class Month extends Actor implements IMonth
	{
		private var _obj:Object={Jan: "1", Feb: "2", Mar: "3", Apr: "4", May: "5", Jun: "6", Jul: "7", Aug: "8", Sept: "9", Oct: "10", Nov: "11", Dec: "12"};

		public function getMonthNumbers(_str:String):String
		{
			return this._obj[_str];
		}
	}
}
package com.flasham.garb.service
{
	import com.flasham.garb.model.vo.RSSXML;

	public interface IRssService
	{
		function startup():void;
		function loadRss(_rssUrlStr:String , _name:String):void;
		function SelectChangeLoadRss(_item:RSSXML):void
	}
	
}
package com.flasham.garb.model
{
	import com.flasham.garb.model.vo.RSSXML;
	import com.flasham.garb.view.events.RightMasterListEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class RSSList extends Actor implements IRSSList
	{
		private var _data:ArrayCollection = new ArrayCollection();
		
		public function RSSList(_xml:XML=null)
		{
			super();
			if( _xml != null ){
				FormatXML(_xml);
			}
		}
		
		public function get data():ArrayCollection
		{
			return this._data;
		}
		
		public function FormatXML(_xml:XML):void
		{
			var _length:int = _xml.item.length();
			for(var i:int=0 ; i<_length ; i++)
			{
				var rssXml:RSSXML = new RSSXML();
				rssXml.name = _xml.item[i].@name;
				rssXml.rss = _xml.item[i].@rss;
				rssXml.url = _xml.item[i].@url;
				rssXml.charSet = _xml.item[i].@charSet;
				_data.addItem( rssXml );
			}
			
			dispatch( new RightMasterListEvent( RightMasterListEvent.Up_DATA , this._data ) );
		}
	}
}
package com.flasham.garb.model
{
	import com.flasham.garb.model.vo.Item;
	import com.flasham.garb.view.events.MiddleLeftEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class RSS20 extends Actor implements IRSS20
	{
		private var _items:ArrayCollection;
		
		[Inject]
		public var month:IMonth;
		
		/**
		 *构造RSS20 
		 * @param _xml 传入load载入的xml格式的RSS2.0的内容；
		 * 
		 */		
		public function RSS20()
		{
			super();
		}
		
		/**
		 *格式化RSS 
		 * @param _xml
		 * 
		 */		
		public function FormatRSS( _xml:XML ):ArrayCollection
		{
			//trace(_xml.channel.item);
			
			_items = new ArrayCollection();
			var _length:int = _xml.channel.item.length();
			for(var i:int=0 ; i<_length ; i++ )
			{
				var itemXML:XML = _xml.channel.item[i];
				var _item:Item = new Item();
				_item.title = itemXML.title;
				_item.link = itemXML.link;
				//_item.description = itemXML.description;
				_item.description = cutString( deleteHtml(itemXML.description) , 120 );
				_item.creators = itemXML.creators;
				_item.pubDate = FormatData( itemXML.pubDate );
				_items.addItem( _item );
			}
			dispatch( new MiddleLeftEvent( MiddleLeftEvent.LIST_DATAUP , _items ) );
			return _items;
		}
		
		public function cutString(_str:String , _length:int ):String
		{
			if(_str.length>_length)
			{
				_str = _str.slice( 0 , _length );
				_str += "...";
			}
			return _str;
		}
		
		/**
		 *去除html标记 
		 * @param _str 原字符串
		 * @return  返回去除html标签后的字符串
		 * 
		 */		
		public function deleteHtml(_str:String):String
		{
			return  String(_str).replace(/<[^>]*>/gim,"");
		}
		
		public function FormatData(_str:String):String
		{
			var _array:Array = _str.split(" ");
			return String( "("+ _array[3] +"-"+ month.getMonthNumbers(_array[2]) +"-"+ _array[1] +"-"+ _array[4] + ")" );
		}
		
		/**
		 *获取格式化后的 
		 * @return 
		 * 
		 */		
		public function get items():ArrayCollection
		{
			return _items;
		}
		
	}
}
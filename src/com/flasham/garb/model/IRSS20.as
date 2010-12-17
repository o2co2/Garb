package com.flasham.garb.model
{
	import mx.collections.ArrayCollection;
	
	public interface IRSS20
	{
		function FormatRSS( _xml:XML ):ArrayCollection
		function get items():ArrayCollection;
	}
}
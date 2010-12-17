package com.flasham.garb.model
{
	import mx.collections.ArrayCollection;

	public interface IRSSList
	{
		function FormatXML(_xml:XML):void;
		function get data():ArrayCollection;
	}
}

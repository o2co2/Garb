package com.flasham.garb.view.mediators.middle
{
	import com.flasham.garb.view.components.middle.HtmlLeftView;
	import com.flasham.garb.view.events.HtmlLeftEvent;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class HtmlLeftMeditor extends Mediator
	{
		[Inject]
		public var view:HtmlLeftView;
		
		public function HtmlLeftMeditor()
		{
			super();
		}
		
		override public function onRegister():void
		{
			
		}
		
		public function onReadButtonClick(e:HtmlLeftEvent ):void
		{
			
		}
	}
}
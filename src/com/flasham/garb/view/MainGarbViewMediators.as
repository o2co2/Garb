package com.flasham.garb.view
{
	import com.flasham.garb.service.ServiceStartupEvent;
	import com.flasham.garb.view.events.MainEnabledEvent;
	import com.flasham.garb.view.events.MainStartEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MainGarbViewMediators extends Mediator
	{
		[Inject]
		public var view:MainGarbView;
		
		public function MainGarbViewMediators()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addContextListener( MainEvent.MAIN_CLOSE , onClick );
			addContextListener( MainEvent.MAIN_MIN ,   onClick );
			
			eventMap.mapListener( view , MouseEvent.MOUSE_DOWN , onMainMove );
			dispatch( new ServiceStartupEvent( ServiceStartupEvent.SERVICE_STARTUP ) );
			
			addContextListener( MainEnabledEvent.MAIN_ENABLD , onMainEnabled );
			addContextListener( MainStartEvent.MAIN_START , onMainStart );
		}
		
		public function onClick(e:MainEvent):void
		{
			switch (e.type) {
				case MainEvent.MAIN_CLOSE:
					view._root.close();
					break;
				case MainEvent.MAIN_MIN:
					view._root.minimize();
					break;
				default:
					trace("Not");
			}
			

			
		}
		
		public function onMainMove(e:MouseEvent):void
		{
			if( e.stageY<140 )
			{
				view._root.nativeWindow.startMove();
			}
		}
		
		public function onMainEnabled(e:MainEnabledEvent):void
		{
			view.middle.mouseEnabled = false;
			view.middle.mouseChildren = false;
		}
		
		public function onMainStart(e:MainStartEvent):void
		{
			view.middle.mouseEnabled = true;
			view.middle.mouseChildren = true;
		}
		
	}
}
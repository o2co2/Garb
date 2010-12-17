package com.flasham.garb.view.mediators
{
	import com.flasham.garb.view.components.ProgressBarView;
	import com.flasham.garb.view.events.BarEvent;
	import com.flasham.garb.view.events.MainEnabledEvent;
	import com.flasham.garb.view.events.MainStartEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class ProgressBarMediators extends Mediator
	{
		[Inject]
		public var view:ProgressBarView

		public function ProgressBarMediators()
		{
			super();
		}

		override public function onRegister():void
		{
			addContextListener(BarEvent.BAR_UPDATA, onUpdata);
			addContextListener(BarEvent.COMPLETE, onUpdata);
		}

		public function onUpdata(e:BarEvent):void
		{
			if (e.type == BarEvent.BAR_UPDATA)
			{
				if (view.visible == false)
				{
					dispatch( new MainEnabledEvent( MainEnabledEvent.MAIN_ENABLD ) );
					view.visible = true;
				}
				view.setProgress(e.ratio, 100);
				view.label="Progress: " + e.ratio + "%";
			}
			else if (e.type == BarEvent.COMPLETE)
			{
				view.visible=false;
				dispatch( new MainStartEvent( MainStartEvent.MAIN_START ) );
			}

		}
	}
}
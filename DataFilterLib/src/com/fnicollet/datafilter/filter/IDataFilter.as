package com.fnicollet.datafilter.filter {
  import flash.events.Event;
  import flash.events.IEventDispatcher;

  /**
   * Interface implemented by every data filter. Used for polymorphism.
   */
  public interface IDataFilter extends IEventDispatcher {
    function apply(item:Object):Boolean;
    function refreshDataProvider(event:Event = null):void;
  }
}


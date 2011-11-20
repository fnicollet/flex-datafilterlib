package com.fnicollet.util {

  public class TraceLogger implements ILogger {
    private static var instance:TraceLogger = null;

    private static var locked:Boolean = true;
    {
      locked = false;
    }

    public function TraceLogger():void {
      if (locked) {
        throw new Error("Unable to construct TraceLogger, use getInstance");
      }
    }

    public static function getInstance():TraceLogger {
      if (instance === null) {
        instance = new TraceLogger();
      }
      return instance;
    }

    public function debug(message:String):void {
      trace("DEBUG : " + message);
    }

    public function error(message:String):void {
      trace("ERROR : " + message);
    }

    public function log(message:String):void {
      trace("        " + message);
    }

    public function warn(message:String):void {
      trace("WARN   : " + message);
    }
  }
}


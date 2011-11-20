package com.fnicollet.util {

  /**
   * Simple Logger to trace and debug
   * @author fab
   */
  public class Logger implements ILogger {
    private static var instance:Logger = null;

    private static var locked:Boolean = true;
    {
      locked = false;
    }

    private var logger:ILogger = null;

    public static function getInstance():Logger {
      if (instance === null) {
        instance = new Logger();
      }
      return instance;
    }

    public function Logger():void {
      if (locked) {
        throw new Error("Unable to create Logger instance, use getInstance instead");
      }
      logger = TraceLogger.getInstance();
    }

    public function log(message:String):void {
      logger.log(message);
    }

    public function debug(message:String):void {
      logger.debug(message);
    }

    public function warn(message:String):void {
      logger.warn(message);
    }

    public function error(message:String):void {
      logger.error(message);
    }
  }
}


package com.fnicollet.util {

  public interface ILogger {
    function log(message:String):void;
    function debug(message:String):void;
    function warn(message:String):void;
    function error(message:String):void;
  }
}


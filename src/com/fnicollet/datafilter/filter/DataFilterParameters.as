package com.fnicollet.datafilter.filter {
  import com.fnicollet.util.Logger;

  import flash.events.Event;
  import flash.events.EventDispatcher;

  [Event(name="filterValuesChanged",type="flash.events.Event")]
  [Event(name="filterKeysChanged",type="flash.events.Event")]
  [Event(name="filterOperatorChanged",type="flash.events.Event")]
  [Event(name="filterIgnoreCase",type="flash.events.Event")]
  [Event(name="filterInvertChanged",type="flash.events.Event")]
  [Event(name="filterActiveChanged",type="flash.events.Event")]
  /**
   * Configuration object for the DataFilter. Can be instanciated with MXML or in AS3 using an object in the constructor.
   * Dispatches event when his values are being changed (through binding for example). Every DataFilter listen to this events
   * @author fab
   */
  public class DataFilterParameters extends EventDispatcher {

    /**
     * Event dispatched when the values proprerty changed
     * @default
     */
    public static const FILTER_VALUES_CHANGED:String = "filterValuesChanged";

    /**
     * Event dispatched when the keys proprerty changed
     * @default
     */
    public static const FILTER_KEYS_CHANGED:String = "filterKeysChanged";

    /**
     * Event dispatched when the filter jokers proprerty changed
     * @default
     */
    public static const FILTER_JOKERS_CHANGED:String = "filterJokersChanged";

    /**
     * Event dispatched when the operator proprerty changed
     * @default
     */
    public static const FILTER_OPERATOR_CHANGED:String = "filterOperatorChanged";

    /**
     * Event dispatched when the ignorecase proprerty changed
     * @default
     */
    public static const FILTER_IGNORECASE_CHANGED:String = "filterIgnoreCase";

    /**
     * Event dispatched when the invert proprerty changed
     * @default
     */
    public static const FILTER_INVERT_CHANGED:String = "filterInvertChanged";

    /**
     * Event dispatched when the active proprerty changed
     * @default
     */
    public static const FILTER_ACTIVE_CHANGED:String = "filterActiveChanged";

    private var _filterType:String = null;

    private var _filterClass:Class = null;

    private var _filterOperator:String = DataFilterSingleValueOperator.EQUALS_TO;

    private var _filterKeys:Array /* of String */ = null;

    private var _filterJokers:Array /* of String */ = null;

    private var _filterValues:Array /* of Object */ = null;

    private var _ignoreCase:Boolean = true;

    private var _invert:Boolean = false;

    private var _active:Boolean = true;

    /**
     * The constructor can be used with a object containing the configuration.
     * @param initialParameters Object with key/value corresponding to the properties
     */
    public function DataFilterParameters(initialParameters:Object = null) {
      var currentValue:Object;
      for (var key:String in initialParameters) {
        currentValue = initialParameters[key]
        switch (key) {
          case "FILTER_TYPE":
            filterType = String(currentValue);
            break;
          case "FILTER_OPERATOR":
            filterOperator = String(currentValue);
            break;
          case "FILTER_KEYS":
            filterKeys = currentValue;
            break;
          case "FILTER_VALUES":
            filterValues = currentValue;
            break;
          case "FILTER_INVERTED":
            invert = Boolean(currentValue);
            break;
          case "FILTER_ACTIVE":
            active = Boolean(currentValue);
            break;
          default:
            Logger.getInstance().warn("Unknown parameter key: " + key + ". Will be ignored");
            break;
        }
        Logger.getInstance().debug("key: " + key);
        Logger.getInstance().debug("value: " + initialParameters[key]);
      }
    }

    // getters and setters
    // getters
    /**
     * Return the type of filter
     * @return
     */
    public function get filterType():String {
      return _filterType;
    }

    /**
     * Return the custom class to instanciate
     * @return
     */
    public function get filterClass():Class {
      return _filterClass;
    }

    /**
     * Return the operator used
     * @return
     */
    public function get filterOperator():String {
      return _filterOperator;
    }

    /**
     * Return an Array of Keys on which the filter will operate.
     * So far, the basic filters only used the first value
     * @return
     */
    public function get filterKeys():Array {
      return _filterKeys;
    }

    /**
     * Return an Array of values considered as wildcards.
     * @return
     */
    public function get filterJokers():Array {
      return _filterJokers;
    }

    /**
     * Return an Array of values on which the filter will operate
     * @return
     */
    public function get filterValues():Array {
      return _filterValues;
    }

    /**
     *
     * @return true if the filter is case unsensitive
     */
    public function get ignoreCase():Boolean {
      return _ignoreCase;
    }

    /**
     *
     * @return true if the filter is inverted
     */
    public function get invert():Boolean {
      return _invert;
    }

    /**
     *
     * @return true if the filter is activated
     */
    public function get active():Boolean {
      return _active;
    }

    // setters
    /**
     *
     * @param value
     */
    public function set filterType(value:String):void {
      _filterType = value;
    }

    /**
     *
     * @param value
     */
    public function set filterClass(value:Class):void {
      _filterClass = value;
    }

    /**
     *
     * @param value
     */
    public function set filterOperator(value:String):void {
      if (value != _filterOperator) {
        _filterOperator = value;
        dispatchEvent(new Event(FILTER_OPERATOR_CHANGED));
      }
    }

    /**
     *
     * @param value
     */
    public function set filterKeys(value:*):void {
      if (value is Array) {
        _filterKeys = value;
      } else {
        _filterKeys = [value];
      }
      dispatchEvent(new Event(FILTER_KEYS_CHANGED));
    }

    /**
     *
     * @param value
     */
    public function set filterJokers(value:*):void {
      if (value is Array) {
        _filterJokers = value;
      } else {
        _filterJokers = [value];
      }
      dispatchEvent(new Event(FILTER_JOKERS_CHANGED));
    }

    /**
     *
     * @param value
     */
    public function set filterValues(value:*):void {
      if (value is Array) {
        _filterValues = value;
      } else {
        if (_filterValues && _filterValues[0] == value) {
          return;
        }
        _filterValues = [value];
      }
      dispatchEvent(new Event(FILTER_VALUES_CHANGED));
    }

    /**
     *
     * @param value
     */
    public function set invert(value:Boolean):void {
      if (_invert != value) {
        _invert = value;
        dispatchEvent(new Event(FILTER_INVERT_CHANGED));
      }
    }

    public function set ignoreCase(value:Boolean):void {
      if (_ignoreCase != value) {
        _ignoreCase = value;
        dispatchEvent(new Event(FILTER_IGNORECASE_CHANGED));
      }
    }

    /**
     *
     * @param value
     */
    public function set active(value:Boolean):void {
      if (_active != value) {
        _active = value;
        dispatchEvent(new Event(FILTER_ACTIVE_CHANGED));
      }
    }
  }
}


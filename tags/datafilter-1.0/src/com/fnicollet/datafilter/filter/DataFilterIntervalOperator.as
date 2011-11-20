package com.fnicollet.datafilter.filter {

  /**
   * Constants that can be used to define a DataFilterInterval (filterOperator)
   * @author fab
   */
  public class DataFilterIntervalOperator {

    /**
     * Interval closed on both sides
     * @default
     */
    public static const INTERVAL_CLOSED:String = "IntervalClosed";

    /**
     * Interval opened on both sides
     * @default
     */
    public static const INTERVAL_OPEN:String = "IntervalOpen";

    /**
     * Interval open on the right side
     * @default
     */
    public static const INTERVAL_OPEN_LEFT:String = "IntervalOpenLeft";

    /**
     * Interval open on the left side
     * @default
     */
    public static const INTERVAL_OPEN_RIGHT:String = "IntervalOpenRight";

    /**
     *
     */
    public function DataFilterIntervalOperator() {
    }

  }
}


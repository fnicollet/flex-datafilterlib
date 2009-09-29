package custom {
  import com.fnicollet.datafilter.filter.DataFilterBase;
  import com.fnicollet.datafilter.filter.DataFilterParameters;

  import model.CustomSimpleObject;

  /**
   * Simple Filter extending the Base of every filter of the library
   */
  public class CustomSimpleFilter extends DataFilterBase {
    public function CustomSimpleFilter(parameters:DataFilterParameters = null) {
      super(parameters);
    }

    private function get valueEntered():Date {
      return _parameters.filterValues[0] as Date;
    }

    /**
     * The filter applied cast the item as a CustomSimpleObject. Properties are then strongly typed.
     */
    override public function apply(item:Object):Boolean {
      var typedItem:CustomSimpleObject = item as CustomSimpleObject;
      var dateToFilter:Date = typedItem.startDate;
      var result:Boolean = dateToFilter < valueEntered;
      return applyConstraints(result);
    }

  }
}
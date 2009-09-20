package com.fnicollet.datafilter.filter {
  import com.fnicollet.util.Logger;

  import flash.utils.getDefinitionByName;

  /**
   * Factory used to instanciate the data filters, depending on the DataFilterParameters
   * Use the createDataFilter static method to create a data filter.
   * Shouldn't be used directly, done automatically when adding some DataFilterParameters to a DataFilterSet
   * @see DataFilterParameters
   * @see DataFilterSet
   * @author fab
   */
  public class DataFilterFactory {
    public function DataFilterFactory() {
    }

    /**
     * Instanciate a DataFilter from an instance of DataFilterParameters.
     * The parameters contain the type (constants in parameters.filterType) or a reference to the class to instanciate (in parameters.filterClass)
     * @param parameters Instance of DataFilterParameters used to build the object
     * @return instace of a DataFilter (typed as IDataFilter)
     */
    public static function createDataFilter(parameters:DataFilterParameters):IDataFilter {
      var dataFilter:IDataFilter = null;
      if (parameters.filterType) {
        switch (parameters.filterType) {
          case DataFilterType.SINGLE_VALUE:
            dataFilter = new DataFilterSingleValue(parameters);
            break;
          case DataFilterType.INTERVAL:
            dataFilter = new DataFilterInterval(parameters);
            break;
          default:
            Logger.getInstance().warn("DataFilterFactory::createDataFilter: The Filter can't be created (Type Unknwown): " + parameters.filterType);
            break;
        }
      } else if (parameters.filterClass) {
        // instanciation of the class passed in parameters
        var classToInit:Class = parameters.filterClass;
        dataFilter = new classToInit(parameters);
      }
      if (!dataFilter) {
        Logger.getInstance().warn("DataFilterFactory::createDataFilter: The Filter can't be created: " + parameters.filterType);
      }
      return dataFilter;
    }

  }
}


public with sharing class PaginationHandler {
    
    @AuraEnabled
    public static Map<String, Object> getColumnsAndData(String sObjectName, List<String> sObjectFieldsNames) {
        try{
            Map<String, Schema.SObjectField> m = Schema.describeSObjects(sObjectName.split(','))[0].fields.getMap();
            List<Object> columns = new List<Object>();
            for ( String fieldName: sObjectFieldsNames ) {
                Schema.DescribeFieldResult dfr = m.get( fieldName ).getDescribe();
                Map<String, Object> column = new Map<String, Object>{
                    'label' => dfr.getLabel(),
                    'fieldName' => dfr.getName(),
                    'type' => String.valueOf( dfr.getType() ).toLowerCase(),
                    'sortable'=>true
                };
                columns.add( column );
            }
            String query = 'SELECT ' + String.join( sObjectFieldsNames, ', ') + ' FROM ' + sObjectName;
            List<SObject> records = Database.query( query );
            return new Map<String, Object>{
                'columns' => columns,
                'data' => records
            };
        } 
        catch(Exception ex) {            
            return new MAP<string,object>{'Exception'=>ex.getMessage()};
        }
    }
 }
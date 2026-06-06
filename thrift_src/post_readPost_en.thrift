include "general.thrift"

namespace py tapsonic.post_readPost_en

struct readPost {
    1: optional string call,
    2: optional general.PostDataInfo data,
}

struct readPostRetDataInfo {
    1: optional i64 idx,
}

struct readPostReturn {
    1: optional general.errorRetCode error,
    2: optional string mode,
    3: optional string call,
    4: optional readPostRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: readPost
======================================================================
 Example 1:
   Request:
     {1: {'type': 'STRING', 'value': 'readPost'},
      2: {'type': 'STRUCT',
          'value': {1: {'type': 'I32', 'value': 1},
                  2: {'type': 'STRING',
                      'value': '0fee0cf8-8f78-4566-a55e-cc03c1de0c21'},
                  3: {'type': 'STRING', 'value': '443615461'},
                  4: {'type': 'STRING',
                      'value': '1414712093e416ef83989cad46e4efb6'},
                  5: {'type': 'I64', 'value': 6}}}}


   Response: None
*/
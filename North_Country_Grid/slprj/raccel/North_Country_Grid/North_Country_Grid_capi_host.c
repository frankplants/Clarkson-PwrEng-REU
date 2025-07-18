#include "North_Country_Grid_capi_host.h"
static North_Country_Grid_host_DataMapInfo_T root;
static int initialized = 0;
rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        North_Country_Grid_host_InitializeDataMapInfo(&(root), "North_Country_Grid");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}

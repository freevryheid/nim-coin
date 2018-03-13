# CoinMP: Coin-OR Solver C-API
# https://projects.coin-or.org/CoinMP

when defined(windows):
  const libCoinMP = "libCoinMP.dll"
elif defined(macosx):
  const libCoinMP = "libCoinMP.dylib"
else:
  const libCoinMP = "libCoinMP.so(|.1)"

# solver constants
const
  CALL_SUCCESS* = 0
  CALL_FAILED* = -1
  METHOD_DEFAULT* = 0x00000000
  METHOD_PRIMAL* = 0x00000001
  METHOD_DUAL* = 0x00000002
  METHOD_NETWORK* = 0x00000004
  METHOD_BARRIER* = 0x00000008
  METHOD_BENDERS* = 0x00000100
  METHOD_DEQ* = 0x00000200
  METHOD_EV* = 0x00000400
  FEATURE_LP* = 0x00000001
  FEATURE_QP* = 0x00000002
  FEATURE_QCP* = 0x00000004
  FEATURE_NLP* = 0x00000008
  FEATURE_MIP* = 0x00000010
  FEATURE_MIQP* = 0x00000020
  FEATURE_MIQCP* = 0x00000040
  FEATURE_MINLP* = 0x00000080
  FEATURE_SP* = 0x00010000
  OBJSENS_MAX* = -1
  OBJSENS_MIN* = 1
  FILE_LOG* = 0
  FILE_BASIS* = 1
  FILE_MIPSTART* = 2
  FILE_MPS* = 3
  FILE_LP* = 4
  FILE_BINARY* = 5
  FILE_OUTPUT* = 6
  FILE_BINOUT* = 7
  FILE_IIS* = 8
  CHECK_COLCOUNT* = 1
  CHECK_ROWCOUNT* = 2
  CHECK_RANGECOUNT* = 3
  CHECK_OBJSENSE* = 4
  CHECK_ROWTYPE* = 5
  CHECK_MATBEGIN* = 6
  CHECK_MATCOUNT* = 7
  CHECK_MATBEGCNT* = 8
  CHECK_MATBEGNZ* = 9
  CHECK_MATINDEX* = 10
  CHECK_MATINDEXROW* = 11
  CHECK_BOUNDS* = 12
  CHECK_COLTYPE* = 13
  CHECK_COLNAMES* = 14
  CHECK_COLNAMESLEN* = 15
  CHECK_ROWNAMES* = 16
  CHECK_ROWNAMSLEN* = 17

# coin constants
const
  SOLVEMETHOD* = 1
  PRESOLVETYPE* = 2
  SCALING* = 3
  PERTURBATION* = 4
  PRIMALPIVOTALG* = 5
  DUALPIVOTALG* = 6
  LOGLEVEL* = 7
  MAXITER* = 8
  CRASHIND* = 9
  CRASHPIVOT* = 10
  CRASHGAP* = 11
  PRIMALOBJLIM* = 12
  DUALOBJLIM* = 13
  PRIMALOBJTOL* = 14
  DUALOBJTOL* = 15
  MAXSECONDS* = 16
  MIPMAXNODES* = 17
  MIPMAXSOL* = 18
  MIPMAXSEC* = 19
  MIPFATHOMDISC* = 20
  MIPHOTSTART* = 21
  MIPMINIMUMDROP* = 22
  MIPMAXCUTPASS* = 23
  MIPMAXPASSROOT* = 24
  MIPSTRONGBRANCH* = 25
  MIPSCANGLOBCUTS* = 26
  MIPINTTOL* = 30
  MIPINFWEIGHT* = 31
  MIPCUTOFF* = 32
  MIPABSGAP* = 33
  MIPFRACGAP* = 34
  MIPCUT_PROBING* = 110
  MIPPROBE_FREQ* = 111
  MIPPROBE_MODE* = 112
  MIPPROBE_USEOBJ* = 113
  MIPPROBE_MAXPASS* = 114
  MIPPROBE_MAXPROBE* = 115
  MIPPROBE_MAXLOOK* = 116
  MIPPROBE_ROWCUTS* = 117
  MIPCUT_GOMORY* = 120
  MIPGOMORY_FREQ* = 121
  MIPGOMORY_LIMIT* = 122
  MIPGOMORY_AWAY* = 123
  MIPCUT_KNAPSACK* = 130
  MIPKNAPSACK_FREQ* = 131
  MIPKNAPSACK_MAXIN* = 132
  MIPCUT_ODDHOLE* = 140
  MIPODDHOLE_FREQ* = 141
  MIPODDHOLE_MINVIOL* = 142
  MIPODDHOLE_MINVIOLPER* = 143
  MIPODDHOLE_MAXENTRIES* = 144
  MIPCUT_CLIQUE* = 150
  MIPCLIQUE_FREQ* = 151
  MIPCLIQUE_PACKING* = 152
  MIPCLIQUE_STAR* = 153
  MIPCLIQUE_STARMETHOD* = 154
  MIPCLIQUE_STARMAXLEN* = 155
  MIPCLIQUE_STARREPORT* = 156
  MIPCLIQUE_ROW* = 157
  MIPCLIQUE_ROWMAXLEN* = 158
  MIPCLIQUE_ROWREPORT* = 159
  MIPCLIQUE_MINVIOL* = 160
  MIPCUT_LIFTPROJECT* = 170
  MIPLIFTPRO_FREQ* = 171
  MIPLIFTPRO_BETAONE* = 172
  MIPCUT_SIMPROUND* = 180
  MIPSIMPROUND_FREQ* = 181
  MIPUSECBCMAIN* = 200

type
  HPROB* = pointer
  COIN_MSGLOG_CB* = proc (MessageStr: cstring; UserParam: pointer): cint
  COIN_LPITER_CB* = proc (IterCount: cint; ObjectValue: cdouble; IsFeasible: cint; InfeasValue: cdouble; UserParam: pointer): cint
  COIN_MIPNODE_CB* = proc (IterCount: cint; MipNodeCount: cint; BestBound: cdouble; BestInteger: cdouble; IsMipImproved: cint; UserParam: pointer): cint

proc initSolver*(LicenseStr: cstring): cint {.cdecl, importc: "CoinInitSolver", dynlib: libCoinMP.}
proc freeSolver*(): cint {.cdecl, importc: "CoinFreeSolver", dynlib: libCoinMP.}
proc getSolverName*(): cstring {.cdecl, importc: "CoinGetSolverName", dynlib: libCoinMP.}
proc getSolverNameBuf*(SolverName: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetSolverNameBuf", dynlib: libCoinMP.}
proc getVersionStr*(): cstring {.cdecl, importc: "CoinGetVersionStr", dynlib: libCoinMP.}
proc getVersionStrBuf*(VersionStr: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetVersionStrBuf", dynlib: libCoinMP.}
proc getVersion*(): cdouble {.cdecl, importc: "CoinGetVersion", dynlib: libCoinMP.}
proc getFeatures*(): cint {.cdecl, importc: "CoinGetFeatures", dynlib: libCoinMP.}
proc getMethods*(): cint {.cdecl, importc: "CoinGetMethods", dynlib: libCoinMP.}
proc getInfinity*(): cdouble {.cdecl, importc: "CoinGetInfinity", dynlib: libCoinMP.}
proc createProblem*(ProblemName: cstring): HPROB {.cdecl, importc: "CoinCreateProblem", dynlib: libCoinMP.}
proc loadMatrix*(hProb: HPROB; ColCount: cint; RowCount: cint; NZCount: cint; RangeCount: cint; ObjectSense: cint; ObjectConst: cdouble; ObjectCoeffs: ptr cdouble; LowerBounds: ptr cdouble; UpperBounds: ptr cdouble; RowType: cstring; RHSValues: ptr cdouble; RangeValues: ptr cdouble; MatrixBegin: ptr cint; MatrixCount: ptr cint; MatrixIndex: ptr cint; MatrixValues: ptr cdouble): cint {.cdecl, importc: "CoinLoadMatrix", dynlib: libCoinMP.}
proc loadNames*(hProb: HPROB; ColNamesList: cstringArray; RowNamesList: cstringArray; ObjectName: cstring): cint {.cdecl, importc: "CoinLoadNames", dynlib: libCoinMP.}
proc loadNamesBuf*(hProb: HPROB; ColNamesBuf: cstring; RowNamesBuf: cstring; ObjectName: cstring): cint {.cdecl, importc: "CoinLoadNamesBuf", dynlib: libCoinMP.}
proc loadProblem*(hProb: HPROB; ColCount: cint; RowCount: cint; NonZeroCount: cint; RangeCount: cint; ObjectSense: cint; ObjectConst: cdouble; ObjectCoeffs: ptr cdouble; LowerBounds: ptr cdouble; UpperBounds: ptr cdouble; RowType: cstring; RHSValues: ptr cdouble; RangeValues: ptr cdouble; MatrixBegin: ptr cint; MatrixCount: ptr cint; MatrixIndex: ptr cint; MatrixValues: ptr cdouble; ColNamesList: cstringArray; RowNamesList: cstringArray; objName: cstring): cint {.cdecl, importc: "CoinLoadProblem", dynlib: libCoinMP.}
#proc loadProblemBuf*(hProb: HPROB; ColCount: cint; RowCount: cint; NonZeroCount: cint; RangeCount: cint; ObjectSense: cint; ObjectConst: cdouble; ObjectCoeffs: ptr cdouble; LowerBounds: ptr cdouble; UpperBounds: ptr cdouble; RowType: cstring; RHSValues: ptr cdouble; RangeValues: ptr cdouble; MatrixBegin: ptr cint; MatrixCount: ptr cint; MatrixIndex: ptr cint; MatrixValues: ptr cdouble; ColNamesBuf: cstring; RowNamesBuf: cstring; ObjectName: cstring): cint {.cdecl, importc: "CoinLoadProblemBuf", dynlib: libCoinMP.}
proc loadInitValues*(hProb: HPROB; InitValues: ptr cdouble): cint {.cdecl, importc: "CoinLoadInitValues", dynlib: libCoinMP.}
proc loadInteger*(hProb: HPROB; ColumnType: cstring): cint {.cdecl, importc: "CoinLoadInteger", dynlib: libCoinMP.}
proc loadPriority*(hProb: HPROB; PriorCount: cint; PriorIndex: ptr cint; PriorValues: ptr cint; PriorBranch: ptr cint): cint {.cdecl, importc: "CoinLoadPriority", dynlib: libCoinMP.}
proc loadSos*(hProb: HPROB; SosCount: cint; SosNZCount: cint; SosType: ptr cint; SosPrior: ptr cint; SosBegin: ptr cint; SosIndex: ptr cint; SosRef: ptr cdouble): cint {.cdecl, importc: "CoinLoadSos", dynlib: libCoinMP.}
proc loadSemiCont*(hProb: HPROB; SemiCount: cint; SemiIndex: ptr cint): cint {.cdecl, importc: "CoinLoadSemiCont", dynlib: libCoinMP.}
proc loadQuadratic*(hProb: HPROB; QuadBegin: ptr cint; QuadCount: ptr cint; QuadIndex: ptr cint; QuadValues: ptr cdouble): cint {.cdecl, importc: "CoinLoadQuadratic", dynlib: libCoinMP.}
proc loadNonlinear*(hProb: HPROB; NlpTreeCount: cint; NlpLineCount: cint; NlpBegin: ptr cint; NlpOper: ptr cint; NlpArg1: ptr cint; NlpArg2: ptr cint; NlpIndex1: ptr cint; NlpIndex2: ptr cint; NlpValue1: ptr cdouble; NlpValue2: ptr cdouble): cint {.cdecl, importc: "CoinLoadNonlinear", dynlib: libCoinMP.}
proc unloadProblem*(hProb: HPROB): cint {.cdecl, importc: "CoinUnloadProblem", dynlib: libCoinMP.}
proc checkProblem*(hProb: HPROB): cint {.cdecl, importc: "CoinCheckProblem", dynlib: libCoinMP.}
#  int    (SOLVCALL *CoinSetLoadNamesType)(HPROB hProb, int LoadNamesType);
proc getProblemName*(hProb: HPROB): cstring {.cdecl, importc: "CoinGetProblemName", dynlib: libCoinMP.}
proc getProblemNameBuf*(hProb: HPROB; ProblemName: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetProblemNameBuf", dynlib: libCoinMP.}
proc getColCount*(hProb: HPROB): cint {.cdecl, importc: "CoinGetColCount", dynlib: libCoinMP.}
proc getRowCount*(hProb: HPROB): cint {.cdecl, importc: "CoinGetRowCount", dynlib: libCoinMP.}
proc getColName*(hProb: HPROB; col: cint): cstring {.cdecl, importc: "CoinGetColName", dynlib: libCoinMP.}
proc getColNameBuf*(hProb: HPROB; col: cint; ColName: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetColNameBuf", dynlib: libCoinMP.}
proc getRowName*(hProb: HPROB; row: cint): cstring {.cdecl, importc: "CoinGetRowName", dynlib: libCoinMP.}
proc getRowNameBuf*(hProb: HPROB; row: cint; RowName: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetRowNameBuf", dynlib: libCoinMP.}
proc registerMsgLogCallback*(hProb: HPROB; MsgLogCB: COIN_MSGLOG_CB; UserParam: pointer) {.cdecl, importc: "CoinRegisterMsgLogCallback", dynlib: libCoinMP.}
proc registerLPIterCallback*(hProb: HPROB; LPIterCB: COIN_LPITER_CB; UserParam: pointer) {.cdecl, importc: "CoinRegisterLPIterCallback", dynlib: libCoinMP.}
proc registerMipNodeCallback*(hProb: HPROB; MipNodeCB: COIN_MIPNODE_CB; UserParam: pointer) {.cdecl, importc: "CoinRegisterMipNodeCallback", dynlib: libCoinMP.}
#  Depreciated, use CoinRegisterXxxCallback instead
# void   (SOLVCALL *CoinSetMsgLogCallback)(HPROB hProb, MSGLOGCALLBACK MsgLogCallback);
# void   (SOLVCALL *CoinSetIterCallback)(HPROB hProb, ITERCALLBACK IterCallback);
# void   (SOLVCALL *CoinSetMipNodeCallback)(HPROB hProb, MIPNODECALLBACK MipNodeCallback);
proc optimizeProblem*(hProb: HPROB; Method: cint): cint {.cdecl, importc: "CoinOptimizeProblem", dynlib: libCoinMP.}
proc getSolutionStatus*(hProb: HPROB): cint {.cdecl, importc: "CoinGetSolutionStatus", dynlib: libCoinMP.}
proc getSolutionText*(hProb: HPROB): cstring {.cdecl, importc: "CoinGetSolutionText", dynlib: libCoinMP.}
proc getSolutionTextBuf*(hProb: HPROB; SolutionText: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetSolutionTextBuf", dynlib: libCoinMP.}
proc getObjectValue*(hProb: HPROB): cdouble {.cdecl, importc: "CoinGetObjectValue", dynlib: libCoinMP.}
proc getMipBestBound*(hProb: HPROB): cdouble {.cdecl, importc: "CoinGetMipBestBound", dynlib: libCoinMP.}
proc getIterCount*(hProb: HPROB): cint {.cdecl, importc: "CoinGetIterCount", dynlib: libCoinMP.}
proc getMipNodeCount*(hProb: HPROB): cint {.cdecl, importc: "CoinGetMipNodeCount", dynlib: libCoinMP.}
proc getSolutionValues*(hProb: HPROB; Activity: ptr cdouble; ReducedCost: ptr cdouble; SlackValues: ptr cdouble; ShadowPrice: ptr cdouble): cint {.cdecl, importc: "CoinGetSolutionValues", dynlib: libCoinMP.}
proc getSolutionRanges*(hProb: HPROB; ObjLoRange: ptr cdouble; ObjUpRange: ptr cdouble; RhsLoRange: ptr cdouble; RhsUpRange: ptr cdouble): cint {.cdecl, importc: "CoinGetSolutionRanges", dynlib: libCoinMP.}
proc getSolutionBasis*(hProb: HPROB; ColStatus: ptr cint; RowStatus: ptr cint): cint {.cdecl, importc: "CoinGetSolutionBasis", dynlib: libCoinMP.}
proc readFile*(hProb: HPROB; FileType: cint; ReadFilename: cstring) {.cdecl, importc: "CoinReadFile", dynlib: libCoinMP.}
proc writeFile*(hProb: HPROB; FileType: cint; WriteFilename: cstring) {.cdecl, importc: "CoinWriteFile", dynlib: libCoinMP.}
proc openLogFile*(hProb: HPROB; LogFilename: cstring) {.cdecl, importc: "CoinOpenLogFile", dynlib: libCoinMP.}
proc closeLogFile*(hProb: HPROB) {.cdecl, importc: "CoinCloseLogFile", dynlib: libCoinMP.}
proc getOptionCount*(hProb: HPROB): cint {.cdecl, importc: "CoinGetOptionCount", dynlib: libCoinMP.}
proc locateOptionID*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinLocateOptionID", dynlib: libCoinMP.}
proc locateOptionName*(hProb: HPROB; OptionName: cstring): cint {.cdecl, importc: "CoinLocateOptionName", dynlib: libCoinMP.}
proc getOptionID*(hProb: HPROB; OptionNr: cint): cint {.cdecl, importc: "CoinGetOptionID", dynlib: libCoinMP.}
proc getOptionInfo*(hProb: HPROB; OptionNr: cint; OptionID: ptr cint; GroupType: ptr cint; OptionType: ptr cint): cint {.cdecl, importc: "CoinGetOptionInfo", dynlib: libCoinMP.}
proc getIntOptionMinMax*(hProb: HPROB; OptionNr: cint; MinValue: ptr cint; MaxValue: ptr cint): cint {.cdecl, importc: "CoinGetIntOptionMinMax", dynlib: libCoinMP.}
proc getRealOptionMinMax*(hProb: HPROB; OptionNr: cint; MinValue: ptr cdouble; MaxValue: ptr cdouble): cint {.cdecl, importc: "CoinGetRealOptionMinMax", dynlib: libCoinMP.}
#proc getOptionNames*(hProb: HPROB; OptionNr: cint; OptionName: cstring; ShortName: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetOptionNames", dynlib: libCoinMP.}
proc getOptionGroup*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinGetOptionGroup", dynlib: libCoinMP.}
proc getOptionType*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinGetOptionType", dynlib: libCoinMP.}
proc getIntOptionDefaultValue*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinGetIntOptionDefaultValue", dynlib: libCoinMP.}
proc getIntOptionMinValue*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinGetIntOptionMinValue", dynlib: libCoinMP.}
proc getIntOptionMaxValue*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinGetIntOptionMaxValue", dynlib: libCoinMP.}
proc getRealOptionDefaultValue*(hProb: HPROB; OptionID: cint): cdouble {.cdecl, importc: "CoinGetRealOptionDefaultValue", dynlib: libCoinMP.}
proc getRealOptionMinValue*(hProb: HPROB; OptionID: cint): cdouble {.cdecl, importc: "CoinGetRealOptionMinValue", dynlib: libCoinMP.}
proc getRealOptionMaxValue*(hProb: HPROB; OptionID: cint): cdouble {.cdecl, importc: "CoinGetRealOptionMaxValue", dynlib: libCoinMP.}
proc getOptionName*(hProb: HPROB; OptionID: cint): cstring {.cdecl, importc: "CoinGetOptionName", dynlib: libCoinMP.}
proc getOptionNameBuf*(hProb: HPROB; OptionID: cint; OptionName: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetOptionNameBuf", dynlib: libCoinMP.}
proc getOptionShortName*(hProb: HPROB; OptionID: cint): cstring {.cdecl, importc: "CoinGetOptionShortName", dynlib: libCoinMP.}
proc getOptionShortNameBuf*(hProb: HPROB; OptionID: cint; ShortName: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetOptionShortNameBuf", dynlib: libCoinMP.}
proc getOptionChanged*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinGetOptionChanged", dynlib: libCoinMP.}
proc getIntOption*(hProb: HPROB; OptionID: cint): cint {.cdecl, importc: "CoinGetIntOption", dynlib: libCoinMP.}
proc setIntOption*(hProb: HPROB; OptionID: cint; IntValue: cint): cint {.cdecl, importc: "CoinSetIntOption", dynlib: libCoinMP.}
proc getRealOption*(hProb: HPROB; OptionID: cint): cdouble {.cdecl, importc: "CoinGetRealOption", dynlib: libCoinMP.}
proc setRealOption*(hProb: HPROB; OptionID: cint; RealValue: cdouble): cint {.cdecl, importc: "CoinSetRealOption", dynlib: libCoinMP.}
proc getStringOption*(hProb: HPROB; OptionID: cint): cstring {.cdecl, importc: "CoinGetStringOption", dynlib: libCoinMP.}
proc getStringOptionBuf*(hProb: HPROB; OptionID: cint; StringValue: cstring; buflen: cint): cint {.cdecl, importc: "CoinGetStringOptionBuf", dynlib: libCoinMP.}
proc setStringOption*(hProb: HPROB; OptionID: cint; StringValue: cstring): cint {.cdecl, importc: "CoinSetStringOption", dynlib: libCoinMP.}

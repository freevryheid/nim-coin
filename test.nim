import coin, strutils

proc bakery() =
  # A simple product mix model as described here:
  # http://www.maximalsoftware.com/mpltutor/session2.html
  var
    colCount: cint = 2
    rowCount: cint = 3
    nonZeroCount: cint = 4
    rangeCount: cint = 0

    objName = "Profit"
    objSense: cint = OBJSENS_MAX
    objConst: cdouble = -4000.0 / 30.0
    objCoeffs: array[2, cdouble] = [0.05, 0.08]

    lowerBounds: array[2, cdouble] = [0.0, 0.0]
    upperBounds: array[2, cdouble]  = [1000000.0, 1000000.0]

    rowType: array[3, char] = ['L', 'L', 'L']
    rhsValues: array[3, cdouble] = [1400.0, 8000.0, 5000.0]

    matrixBegin: array[3, cint] = [0.cint, 2.cint, 4.cint]
    matrixCount: array[2, cint] = [2.cint, 2.cint]
    matrixIndex: array[4, cint] = [0.cint, 1.cint, 0.cint, 2.cint]
    matrixValues: array[4, cdouble] = [0.1, 1.0, 0.2, 1.0]

    colNames: array[2, cstring] = ["Sun".cstring, "Moon".cstring]
    rowNames: array[3, cstring] = ["c1".cstring, "c2".cstring, "c3".cstring]

    prob = createProblem("Bakery")
    res = prob.loadMatrix(
      colCount,
      rowCount,
      nonZeroCount,
      rangeCount,
      objSense,
      objConst,
      addr(objCoeffs[0]),
      addr(lowerBounds[0]),
      addr(upperBounds[0]),
      addr(rowType[0]),
      addr(rhsValues[0]),
      nil, # rangeValues
      addr(matrixBegin[0]),
      addr(matrixCount[0]),
      addr(matrixIndex[0]),
      addr(matrixValues[0]))

  res = prob.loadNames(
    addr(colNames[0]),
    addr(rowNames[0]),
    objName)

  res = prob.checkProblem()
  if res != CALL_SUCCESS:
    echo "check problem failed: $1" % [$res]
  res = prob.optimizeProblem(0)
  prob.writeFile(FILE_MPS, "test.mps")

  echo "Problem: $1" % [$prob.getProblemName()]
  echo "Result: $1" % [$prob.getSolutionText()]
  echo "Status: $1" % [$prob.getSolutionStatus()]
  echo "Optimal: $1" % [$prob.getObjectValue()]

  res = prob.unloadProblem()

proc main() =
  discard initSolver("")
  echo "$1 version $2" % [$getSolverName(), $getVersion()]
  bakery()
  discard freeSolver()

main()



[variables/localVariables.sh](src/variables/localVariables.sh)



[variables/defaultValue.sh](src/variables/defaultValue.sh)

- printProductName


[variables/integerTests.sh](src/variables/integerTests.sh)



[fileIO/md5hash.sh](src/fileIO/md5hash.sh)

- createMd5hashFromFile
- createMd5hashFromString


[fileIO/inAndOut.sh](src/fileIO/inAndOut.sh)



[fileIO/createTempFileDir.sh](src/fileIO/createTempFileDir.sh)



[fileIO/createDataFileDD.sh](src/fileIO/createDataFileDD.sh)

- createFileWithRandomBytes


[fileIO/sha1sum.sh](src/fileIO/sha1sum.sh)

- genSha1HashFromFile


[logging/printing.sh](src/logging/printing.sh)

- callPrintf
- printInColumns
- printToVariable
- parseWhitespaces


[logging/redirectOutput.sh](src/logging/redirectOutput.sh)



[logging/logger_.sh](src/logging/logger_.sh)



[terminal_/fontColor.sh](src/terminal_/fontColor.sh)

- printInColor


[archives/debExamples.sh](src/archives/debExamples.sh)



[archives/tarExamples.sh](src/archives/tarExamples.sh)

- setUp
- tearDown
- compressDirectory
- decompressDirectory


[archives/xzExamples.sh](src/archives/xzExamples.sh)

- compressSingleFile
- compressMultipleFilesSeparately


[execution/checkExitStatus.sh](src/execution/checkExitStatus.sh)

- echoExitStatus


[execution/multiLineStatement.sh](src/execution/multiLineStatement.sh)



[execution/validateArgs.sh](src/execution/validateArgs.sh)

- validate


[execution/callOtherCommands.sh](src/execution/callOtherCommands.sh)



[execution/noop.sh](src/execution/noop.sh)



[execution/multiCommandOneliner.sh](src/execution/multiCommandOneliner.sh)

- multipleCommandsInOneLine


[execution/earlyTermination.sh](src/execution/earlyTermination.sh)

- setUp
- build
- verifyBuild


[dotgraph/bst.sh](src/dotgraph/bst.sh)



[arithmetics/mixedTypes.sh](src/arithmetics/mixedTypes.sh)

- implicitCast


[processes/waitAndDie.sh](src/processes/waitAndDie.sh)



[processes/createChildProcess.sh](src/processes/createChildProcess.sh)

- createPythonProgram
- launchChild
- shutdownChild


[processes/selfStatus.sh](src/processes/selfStatus.sh)



[processes/findPidFromProgram.sh](src/processes/findPidFromProgram.sh)

- listPidsByProgramName


[processes/findProcessCwd.sh](src/processes/findProcessCwd.sh)



[processes/countLines.sh](src/processes/countLines.sh)



[processes/signals.sh](src/processes/signals.sh)



[processes/findChildAndParentProcesses.sh](src/processes/findChildAndParentProcesses.sh)

- listChildProcesses
- printParentPid


[processes/printProcessTree.sh](src/processes/printProcessTree.sh)



[processes/findProcessBeacon.sh](src/processes/findProcessBeacon.sh)

- dothis


[processes/explicitSubshell.sh](src/processes/explicitSubshell.sh)



[processes/execve.sh](src/processes/execve.sh)



[processes/processGrep.sh](src/processes/processGrep.sh)

- searchForProcess


[processes/isDebuggerPresent.sh](src/processes/isDebuggerPresent.sh)



[expansions/commandSubs.sh](src/expansions/commandSubs.sh)

- commandExpansionUsingCustomIFS
- commandExpansionUsingDefaultIFS


[expansions/arithmeticExpansion.sh](src/expansions/arithmeticExpansion.sh)



[expansions/processSubs.sh](src/expansions/processSubs.sh)



[expansions/variableExpansion.sh](src/expansions/variableExpansion.sh)

- useCurlyBracketsToProtectVariable
- stringLength
- findAndReplace


[expansions/pathnameExpansion.sh](src/expansions/pathnameExpansion.sh)

- globFiles


[codeStyle/style_v1.sh](src/codeStyle/style_v1.sh)



[streams_/stdInOutErr.sh](src/streams_/stdInOutErr.sh)

- redirectionStdOutAndErrSeparately
- redirectionStdOutAndErrToOneFile
- redirectStdInFromFile


[streams_/readToVars.sh](src/streams_/readToVars.sh)

- readLineToVars


[fileSystem/overrideDanglingSymlink.sh](src/fileSystem/overrideDanglingSymlink.sh)



[fileSystem/fileTestExpressions.sh](src/fileSystem/fileTestExpressions.sh)

- fileIsSymbolicLink
- fileIsExecutable


[fileSystem/absFilePath.sh](src/fileSystem/absFilePath.sh)



[fileSystem/pathManip.sh](src/fileSystem/pathManip.sh)

- getAbsolutePath
- getAbsolutePathByVar


[fileSystem/umaskTest.sh](src/fileSystem/umaskTest.sh)



[fileSystem/listConnectedDrives.sh](src/fileSystem/listConnectedDrives.sh)



[fileSystem/checkFileTypeAndSymlink.sh](src/fileSystem/checkFileTypeAndSymlink.sh)

- fileInfo


[fileSystem/checkExistence.sh](src/fileSystem/checkExistence.sh)

- checkPlainFile


[fileSystem/ginstall.sh](src/fileSystem/ginstall.sh)

- setUp
- buildSUTProgram
- modifyArtifactDirectory
- copyArtifactToDest
- copyArtifactDirectoryToDest
- tearDown


[fileSystem/showFreeSpace.sh](src/fileSystem/showFreeSpace.sh)



[fileSystem/forEachFile.sh](src/fileSystem/forEachFile.sh)



[fileSystem/find](src/fileSystem/find)

- walk


[fileSystem/find](src/fileSystem/find)



[fileSystem/find](src/fileSystem/find)



[fileSystem/find](src/fileSystem/find)



[fileSystem/find](src/fileSystem/find)



[fileSystem/find](src/fileSystem/find)

- findDirectories
- createFindPatterns


[fileSystem/listDirectoriesOnly.sh](src/fileSystem/listDirectoriesOnly.sh)



[functions/returnValue.sh](src/functions/returnValue.sh)

- returnByVarExpansion
- returnByOutputParam
- setGlobalState
- demoReturnByVarExpansion
- demoReturnByOutputParam
- demoSetGlobalState


[functions/arguments.sh](src/functions/arguments.sh)

- takingFourteenArguments
- takingThreeArguments
- shiftArguments
- forEachArgument
- whileEachArgument


[containers/sets.sh](src/containers/sets.sh)



[containers/stack.sh](src/containers/stack.sh)



[containers/arrays.sh](src/containers/arrays.sh)



[logic/switchCases.sh](src/logic/switchCases.sh)



[logic/oneliners.sh](src/logic/oneliners.sh)

- createDirIfNotExist
- compoundConditions


[logic/numericLoop.sh](src/logic/numericLoop.sh)

- iterateOverNumbers


[logic/itemLoop.sh](src/logic/itemLoop.sh)

- iterateOverFilePaths


[logic/forLoops.sh](src/logic/forLoops.sh)

- doubleGrep
- useAwkArray


[logic/whileLoops.sh](src/logic/whileLoops.sh)

- readLinesFromFile


[logic/booleans.sh](src/logic/booleans.sh)



[logic/conditionals.sh](src/logic/conditionals.sh)

- twoBranches
- prt
- logicalOR
- logicalAND
- combine


[strings_/manip.sh](src/strings_/manip.sh)

- join
- joins
- len
- stripSuffix
- stripPrefix
- replace
- sub
- toUpper
- toLower
- sortAndUnique


[strings_/parameterExpansion.sh](src/strings_/parameterExpansion.sh)

- defaultValueIfEmptyOrUnset
- defaultValueIfUnset
- alternativeValueIfSetAndNotEmpty
- alternativeValueIfSet
- requireVarIsSet
- setDefaultValues
- getVariableLength


[strings_/cutColumns.sh](src/strings_/cutColumns.sh)

- cutColumns


[strings_/grep_.sh](src/strings_/grep_.sh)

- countMatchingLines
- countUnmatchingLines


[strings_/singleDoubleQuotes.sh](src/strings_/singleDoubleQuotes.sh)

- singleQuoteSubstitution
- doubleQuoteSubstitution


[strings_/wordSplitting.sh](src/strings_/wordSplitting.sh)

- printArgs
- demoDefaultIFS
- demoCustomIFS


[strings_/stringTests.sh](src/strings_/stringTests.sh)

- stringContains
- stringIsDigit
- enoughArguments


[pdf/creation](src/pdf/creation)

- createFromJPGs
- doPDFShrink


[xargs/trickyFilePaths.sh](src/xargs/trickyFilePaths.sh)



[pipelines/fifoMessagePassing.sh](src/pipelines/fifoMessagePassing.sh)

- _free
- _init
- messageServer
- main


[pipelines/printToTee.sh](src/pipelines/printToTee.sh)

- writeToTee


[pipelines/fifoControl.sh](src/pipelines/fifoControl.sh)

- _free
- _init
- demoPythonWaitForBash
- demoBashWaitForPython


[pipelines/teeToMultipleOutputs.sh](src/pipelines/teeToMultipleOutputs.sh)

- createExec


[dateAndTime/getDateTime.sh](src/dateAndTime/getDateTime.sh)

- formatDateAndTime


[shellPipe/pipeTextToFile.sh](src/shellPipe/pipeTextToFile.sh)

- setUp
- tearDown
- pipeMultilineTextToFile
- pipeScriptToFile


[shellPipe/read_stdin.sh](src/shellPipe/read_stdin.sh)

- generateSUT


[applications/lineCounter.sh](src/applications/lineCounter.sh)



[applications/lineCounter_test.sh](src/applications/lineCounter_test.sh)



[environments/shellType.sh](src/environments/shellType.sh)



[environments/unamePretty.sh](src/environments/unamePretty.sh)

- show


[environments/checkCommandExistence.sh](src/environments/checkCommandExistence.sh)



[environments/dumpCshEnv.sh](src/environments/dumpCshEnv.sh)



[environments/getRunningScriptPID.sh](src/environments/getRunningScriptPID.sh)

- getCurrentPID
- getCurrentPIDPython
- getBackgroundProcessPID


[environments/envVarForCommand.sh](src/environments/envVarForCommand.sh)

- reset
- createPythonModule
- importPythonModule
- verifyPythonPath
- verifyEnvVarInPython


[environments/getRunningScriptPath.sh](src/environments/getRunningScriptPath.sh)

- getScriptPath


[environments/dumpEnv.sh](src/environments/dumpEnv.sh)



[regexp/conditionalGroup.sh](src/regexp/conditionalGroup.sh)

- ifElseGroup


[regexp/grep_.sh](src/regexp/grep_.sh)



[/](src//)


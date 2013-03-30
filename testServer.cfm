<cfinvoke component="mxunit.runner.DirectoryTestSuite"
          method="run"
          directory="#expandPath('test')#"
          componentPath="[classpath.to.install.location.]mxunit.pluginDemoTests"
          recurse="true"
          excludes="InvalidMarkupTest,FiveSecondTest"
          returnvariable="results" />

<cfoutput> #results.getResultsOutput('extjs')# </cfoutput>

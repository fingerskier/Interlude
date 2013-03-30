<cfcomponent extends="mxunit.framework.TestCase">
	<cffunction name="beforeTests" returntype="void" access="public" hint="put things here that you want to run before all tests">
		<cfset obj = createObject("component","ObjectUnderTest")>

	</cffunction>

	<cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">
		<cfset obj = createObject("component","ObjectUnderTest")>
	</cffunction>
	
	<cffunction name="xxx_should_xxxx_When_xxx" returntype="void" access="public">
		<!--- exercise your component under test --->
		<cfset var result = obj.doSomething()>

		<!--- if you want to "see" your data -- including complex variables, you can pass them to debug() and they will be available to you either in the HTML output or in the Eclipse plugin via rightclick- "Open TestCase results in browser" --->
		<cfset debug(result)>

		<!--- make some assertion based on the result of exercising the component --->
		<cfset assertEquals("SomeExpectedValue",result,"result should've been 'SomeExpectedValue' but was #result#")>

	</cffunction>

	<cffunction name="xxx_should_yyy_when_zzz" returntype="void">
    		<cfset var XX = "">
    		<cfset fail("xxx_should_yyy_when_zzz not yet implemented")>
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public" hint="put things here that you want to run after each test">
	</cffunction>

	<cffunction name="afterTests" returntype="void" access="public" hint="put things here that you want to run after all tests">
	</cffunction>

	<!--- this won't get run b/c it's private --->
	<cffunction name="somePrivateFunction" access="private">
		<cfset marc.getBankAccount().add("5 meeeeelion dollars")>
	</cffunction>
</cfcomponent>

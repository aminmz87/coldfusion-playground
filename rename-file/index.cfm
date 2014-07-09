<!--- this code was created by Mohd Norul Amin bin Mohd Zin --->

<cfset fromPath = expandPath("from/*.*") />
<cfset toPath = expandPath("to/*.*") />

<cfset fromDirectory = GetDirectoryFromPath(fromPath) />
<cfset toDirectory = GetDirectoryFromPath(toPath) />

<!--- Check whether directory is exist or not --->
<cfif directoryExists(fromDirectory)><cfelse><cfdirectory action="create" directory="#fromDirectory#" /></cfif>
<cfif directoryExists(toDirectory)><cfelse><cfdirectory action="create" directory="#toDirectory#" /></cfif>


<cfdirectory action="list" directory="#fromDirectory#" name="listfile" listInfo="name">

<!--- Loop Filename --->
<cfloop query="listfile">

  <cfset filename = listfile.name />
  <cfset prefix = LEFT(filename,9) />
  <cfset postfix = '0' & RIGHT(filename,7) />
  <cfset newfilename = prefix & postfix />

  <cffile action = "copy" source = "#fromDirectory#/#filename#" destination = "#toDirectory#">
  <cffile action = "rename" source = "#toDirectory#/#filename#" destination = "#toDirectory#/#newfilename#">

</cfloop>

<cfdump var="Processing Done" />
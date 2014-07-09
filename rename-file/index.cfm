<!--- this code was created by Mohd Norul Amin bin Mohd Zin --->

<cfset prefixlength = 9 />

<cfset fromPath = expandPath("from/*.*") />
<cfset toPath = expandPath("to/*.*") />
<cfset toHoverPath = expandPath("to-hover/*.*") />

<cfset fromDirectory = GetDirectoryFromPath(fromPath) />
<cfset toDirectory = GetDirectoryFromPath(toPath) />
<cfset toHoverDirectory = GetDirectoryFromPath(toHoverPath) />

<!--- Check whether directory is exist or not --->
<cfif directoryExists(fromDirectory)><cfelse><cfdirectory action="create" directory="#fromDirectory#" /></cfif>
<cfif directoryExists(toDirectory)><cfelse><cfdirectory action="create" directory="#toDirectory#" /></cfif>
<cfif directoryExists(toHoverPath)><cfelse><cfdirectory action="create" directory="#toHoverDirectory#" /></cfif>


<cfdirectory action="list" directory="#fromDirectory#" name="listfile" listInfo="name">

<!--- Loop Filename --->
<cfloop query="listfile">

  <cfset filename = listfile.name />
  <cfset filenamelength = LEN(listfile.name) />

  <cfset prefix = LEFT(filename,prefixlength) />
  <cfset postfix = '0' & RIGHT(filename,filenamelength - prefixlength) />
  <cfset newfilename = prefix & postfix />
  <cfset newfilenamehover = 'S-' & newfilename />

  <cffile action = "copy" source = "#fromDirectory#/#filename#" destination = "#toDirectory#">
  <cffile action = "copy" source = "#fromDirectory#/#filename#" destination = "#toHoverDirectory#">

  <cffile action = "rename" source = "#toDirectory#/#filename#" destination = "#toDirectory#/#newfilename#">
  <cffile action = "rename" source = "#toHoverDirectory#/#filename#" destination = "#toHoverDirectory#/#newfilenamehover#">

</cfloop>

<cfdump var="Processing Done" />
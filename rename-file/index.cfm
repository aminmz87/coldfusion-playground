<cfset fromPath = expandPath("from/*.*") />
<cfset toPath = expandPath("to/*.*") />

<cfset fromDirectory = GetDirectoryFromPath(fromPath) />
<cfset toDirectory = GetDirectoryFromPath(toPath) />


<cfdirectory action="list" directory="#fromDirectory#" name="listfile" listInfo="name">

<cfloop query="listfile">

  <cfset filename = listfile.name />
  <cfset prefix = LEFT(filename,9) />
  <cfset postfix = '0' & RIGHT(filename,7) />
  <cfset newfilename = prefix & postfix />

  <cffile action = "copy" source = "#fromDirectory#/#filename#" destination = "#toDirectory#">
  <cffile action = "rename" source = "#toDirectory#/#filename#" destination = "#toDirectory#/#newfilename#">

</cfloop>

<cfdump var="Processing Done" />


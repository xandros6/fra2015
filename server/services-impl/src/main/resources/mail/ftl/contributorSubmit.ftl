Dear ${receiver.name},

The user ${user.name} has just submitted the survey for ${country}( ${status.country} )

<#if status.message??>
The contributor ${user.name} attached also the following message:
	${status.message}
</#if>

 
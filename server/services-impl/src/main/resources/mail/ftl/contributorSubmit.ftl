Hello ${receiver.name},
The user ${user.name} has just submitted the survey for ${user.countries}
<#if status.message??>
The contributor ${user.name} attached the following message:
	${status.message}
</#if>

 
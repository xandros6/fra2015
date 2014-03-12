Dear ${receiver.name},

The user ${user.name} has just submitted the questionnaire for ${country} (${status.country}) and it is ready for your review. 
http://foreststats.org/fra2015


<#if status.message??>
The contributor ${user.name} also attached the following message:
	${status.message}
</#if>

 

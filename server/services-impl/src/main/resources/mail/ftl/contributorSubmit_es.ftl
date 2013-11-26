Estimado/a ${receiver.name},

El usuario ${user.name} acaba de enviar el cuestionario para el siguiente país: ${country}( ${status.country} ), que está listo para su revisión.
http://foreststats.org/fra2015

<#if status.message??>
El usuario ${user.name} adjunta también el siguiente mensaje:
	${status.message}
</#if>

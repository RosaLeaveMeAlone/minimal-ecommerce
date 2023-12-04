<script>
	import { page } from '$app/stores';
</script>

<h1>Esta es una pagina de error 404 personalizado.</h1>
<h2>{$page.status}: {$page.error.message}</h2>
import { error } from '@sveltejs/kit';
import { env } from '$env/dynamic/public';

const appName = env.PUBLIC_APP_NAME;

/** @type {import('./$types').PageLoad} */
export function load({ params }) {
    // TODO: fetch data for params.id
	if (params.id === '1') {
		return {
			title: `Nombre de Producto | ${appName}`,
			content: 'Welcome to our blog. Lorem ipsum dolor sit amet...'
		};
	}

	error(404, 'Not found');
}
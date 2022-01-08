import type { RequestHandler } from '@sveltejs/kit';

// GET /recipes.json
export const get: RequestHandler = async (req) => {
	// this is where we will fetch from the database
	console.log(`Getting recipe for ${req.params.slug}`)
	const recipe = {
		name: 'Gumbo'
	}

	return {
		body: {
			recipe: recipe
		}
	};
}

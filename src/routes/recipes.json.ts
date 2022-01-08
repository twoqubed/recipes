import type { RequestHandler } from '@sveltejs/kit';

// GET /recipes.json
export const get: RequestHandler = async () => {
    // this is where we will fetch from the database
    const recipes = [
        { id: 'gumbo', name: 'Gumbo' },
        { id: 'jambalaya', name: 'Jambalaya' }
    ]
    
    return {
        body: {
            recipes: recipes
        }
    };
}

import type { RecipeHeader } from '$lib/types';

import { listRecipes } from '$lib/repository'

// GET /recipes.json
export const get = async () => {
    const recipes : RecipeHeader[] = await listRecipes()
    
    return {
        body: {
            recipes: recipes
        }
    };
}

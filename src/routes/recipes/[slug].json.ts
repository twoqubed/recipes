import type { Recipe } from '$lib/types';

import { getRecipe } from '$lib/repository';

// GET /recipes.json
export const get = async (req) => {
  const recipe: Recipe = await getRecipe(req.params.slug);

  return {
    body: {
      recipe: recipe
    }
  };
};

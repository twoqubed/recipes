<script context="module" lang="ts">
	import type { Load } from '@sveltejs/kit';

	export const load: Load = async ({ page, fetch }) => {
		const res = await fetch(`/recipes/${page.params.slug}.json`);
		const json = await res.json();
		return {
			props: {
				recipe: json.recipe
			}
		};
	};
</script>

<script>
	export let recipe;
</script>

<h1>{recipe.name}</h1>

<ul>
	{#each recipe.ingredients as ingredient}
		<li>{ingredient}</li>
	{/each}
</ul>

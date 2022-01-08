<script context="module" lang="ts">
	import type { Load } from '@sveltejs/kit';

	export const load: Load = async ({ fetch }) => {
		const res = await fetch('/recipes.json');
		const json = await res.json();
		return {
			props: {
				recipes: json.recipes
			}
		};
	}
</script>

<script>
	export let recipes;
</script>

<h1>Recipes</h1>

<ul>
	{#each recipes as recipe}
		<li><a href="/recipes/{recipe.id}">{recipe.name}</a></li>
	{/each}
</ul>

<script context="module">
	export async function load() {
		return {
			props: {
				recipes: [
					{ id: 'gumbo', name: 'Gumbo'},
					{ id: 'jambalaya', name: 'Jambalaya' }
				]
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
		<li><a href="/recipe/{recipe.id}">{recipe.name}</a></li>
	{/each}
</ul>

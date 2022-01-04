<script context="module">
	export async function load() {
		return {
			props: {
				recipes: [
                    {name:'gumbo'},
                    {name:'jambalaya'}
                ]
			}
		};
	}
</script>

<script>
	export let recipes;
</script>

<h1>Recipes</h1>
<p>Here is where we will list recipes</p>

<ul>
	{#each recipes as recipe}
		<li>{recipe.name}</li>
	{/each}
</ul>

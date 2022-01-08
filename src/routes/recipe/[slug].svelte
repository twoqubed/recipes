<script context="module">
	export async function load() {
		return {
			props: {
				recipe: {
					name: 'Gumbo'
				}
			}
		};
	}
</script>

<script>
	export let recipe;
</script>

<h1>{recipe.name}</h1>
